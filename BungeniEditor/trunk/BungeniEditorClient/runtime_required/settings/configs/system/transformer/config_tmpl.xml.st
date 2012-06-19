<?xml version="1.0" encoding="UTF-8"?>
<config name="$config-name$">
    <!-- 
        General Properties for the translator 
        -->
    <properties>
            <!-- resource bundle -->
            <entry key="resourceBundlePath">localisation.messages.LabelsBundle</entry>
            <!-- parameter to specify cached pipeline property -->
            <entry key="cachePipelineXSLT">$cache-pipeline$</entry>
             <entry key="inputXmlSource">$input-xml-source$</entry>
    </properties>


    <!-- Specfies the schema for the target xml document -->
    <schema href="configfiles/schema/debate-subschema/akn-subschema-3195136.xsd" />

    <!-- This steps are performed BEFORE the below regex replacement -->
    <input>
        <xslt step="1" name="appendBungeniNS" href="$path$/pipeline_xslt/common/add_bungeni_ns.xsl"/>
        <!-- Add RDF ns -->

         <xslt step="2" name="appendRDFNS" href="$path$/pipeline_xslt/common/add_rdf_ns.xsl"/> 
        <!-- Extract the styles -->
        <xslt step="3" name="mergeStyles" href="$path$/pipeline_xslt/common/merge_styles.xsl"/> 
        <!-- Transform the document to the META Language -->
        <!-- custom steps follow -->
        <!--$input-custom-steps$-->
    </input>
    
    <replacements>
        <!-- Normalise the produced ODF ref elements -->
        <replacement step="1" name="replacerefmarkstart"
            pattern="&lt;text:reference-mark-start([^\/]+)/&gt;" replacement="&lt;ref$1&gt;"/>
        <replacement step="2" name="replacerefmarkend"
            pattern="&lt;text:reference-mark-end([^\/]+)/&gt;" replacement="&lt;/ref&gt;"/>
        <!-- Normalise the produced ODF bookmark elements -->
        <replacement step="3" name="bookmarkstart" pattern="&lt;text:bookmark-start([^\/]+)/&gt;"
            replacement="&lt;ref$1&gt;"/>
        <replacement step="4" name="bookmarkend" pattern="&lt;text:bookmark-end([^\/]+)/&gt;"
            replacement="&lt;/ref&gt;"/>
        <!-- Delete the empty lines -->
        <replacement step="5" name="replaceemptyline" pattern="\n" replacement=""/>
    </replacements>
  
    <!-- This steps are performed AFTER the above regex replacement -->
    <output>
        <!-- Normalise the produced META document -->
        <xslt step="1" name="MetaLanguageNormalisation"
            href="$path$/pipeline_xslt/common/meta_language_normalization.xsl"/>
        <!-- Add the Metalex namespace -->
        <xslt step="2" name="MetaLanguageAddNamespaceMetalex"
            href="$path$/pipeline_xslt/common/meta_language_add_mlx_ns.xsl"/>
        <!-- Add the Bungeni namespace -->
        <xslt step="3" name="MetaLanguageAddNamespaceBungeni"
            href="$path$/pipeline_xslt/common/meta_language_add_bungeni_ns.xsl"/>
        
        <!-- custom steps follow -->
        
        <!--$custom-output-steps$-->
    
    </output>

    <!-- Output is piped to 1 or more named pipelines they are
    called in declared order -->
    <!--
    <pipetoxml name="AnDebate"
               href="pipeline_xslt/debaterecord/pipeline.xsl"  />
               -->
    <!-- Called after translate -->
    
    <postxml>
        <xslt step="1" name="Cleanup" href="$path$/pipeline_xslt/common/cleanup.xsl" />
        <xslt step="2" name="AddNamespaceAkomaNtoso" href="$path$/pipeline_xslt/common/add_an_ns.xsl" />
    </postxml>
    
</config>