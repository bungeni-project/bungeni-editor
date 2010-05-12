SET CLUSTER '';
SET DEFAULT_TABLE_TYPE 0;      
SET TRACE_MAX_FILE_SIZE 1;     
SET WRITE_DELAY 500;           
SET DEFAULT_LOCK_TIMEOUT 1000; 
SET CACHE_SIZE 16384;          
;              
CREATE USER IF NOT EXISTS SA SALT '639c4703c5386f70' HASH '8a14c49558709d0202b9712aa71bd64dee9494450b6b3a06f89e409ac7ae0bae' ADMIN;            
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_113DAF61_DFF7_4070_A19A_8CEBEBC694F7 START WITH 3 BELONGS_TO_TABLE;     
CREATE CACHED TABLE PUBLIC.METADATA_SOURCES(
    ID INT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_113DAF61_DFF7_4070_A19A_8CEBEBC694F7) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_113DAF61_DFF7_4070_A19A_8CEBEBC694F7,
    DISPLAY_NAME VARCHAR(100),
    TABLE_NAME VARCHAR(100)
);      
-- 2 = SELECT COUNT(*) FROM PUBLIC.METADATA_SOURCES;           
INSERT INTO PUBLIC.METADATA_SOURCES(ID, DISPLAY_NAME, TABLE_NAME) VALUES
(1, 'Members of Parliament', 'members_of_parliament'),
(2, 'Tabled Documents', 'tabled_documents');   
CREATE PRIMARY KEY ON PUBLIC.METADATA_SOURCES(ID);             
CREATE CACHED TABLE PUBLIC.EDITOR_MACROS(
    PROG_LANGUAGE CHAR(20) NOT NULL,
    LIBRARY_NAME VARCHAR(100) NOT NULL,
    MACRO_NAME VARCHAR(100) NOT NULL,
    NO_OF_PARAMS INT
);           
-- 24 = SELECT COUNT(*) FROM PUBLIC.EDITOR_MACROS;             
INSERT INTO PUBLIC.EDITOR_MACROS(PROG_LANGUAGE, LIBRARY_NAME, MACRO_NAME, NO_OF_PARAMS) VALUES
('Basic', 'BungeniLibs.Common', 'AddSectionInsideSectionWithStyle', 4),
('Basic', 'BungeniLibs.Common', 'SearchAndReplace', 2),
('Basic', 'BungeniLibs.Common', 'AddSectionInsideSection', 2),
('Basic', 'BungeniLibs.Common', 'InsertHTMLDocumentIntoSection', 3),
('Basic', 'BungeniLibs.Common', 'CursorInSection', 0),
('Basic', 'BungeniLibs.Common', 'AddSectionInsideSectionWithAttributes', 4),
('Basic', 'BungeniLibs.Common', 'SearchAndReplaceWithAttributes', 4),
('Basic', 'BungeniLibs.Common', 'InsertArrayAsBulletList', 3),
('Basic', 'BungeniLibs.Common', 'SearchAndReplace2', 4),
('Basic', 'BungeniLibs.Common', 'AddTextSection', 3),
('Basic', 'BungeniLibs.Common', 'InsertDocumentIntoSection', 3),
('Basic', 'BungeniLibs.Common', 'AddImageIntoSection', 2),
('Basic', 'BungeniLibs.Common', 'SetInputFieldValue', 2),
('Basic', 'BungeniLibs.Common', 'SetReferenceInputFieldValue', 3),
('Basic', 'BungeniLibs.Common', 'SetSectionMetadata', 3),
('Basic', 'BungeniLibs.Common', 'RenameSection', 2),
('Basic', 'BungeniLibs.Common', 'ReplaceLinkInSectionByName', 5),
('Basic', 'BungeniLibs.Common', 'MoveSection', 4),
('Basic', 'BungeniLibs.Common', 'InsertSectionAfterSection', 3),
('Basic', 'BungeniLibs.Common', 'InsertSectionAfterSectionWithStyle', 5),
('Basic', 'BungeniLibs.Common', 'RemoveSectionAndContents', 2),
('Basic', 'BungeniLibs.Common', 'InsertArrayAsBulletListAtCurrentCursor', 3),
('Basic', 'BungeniLibs.Common', 'ReplaceTextWithField', 3),
('Basic', 'BungeniLibs.Common', 'StyleReplace', 1);               
CREATE PRIMARY KEY ON PUBLIC.EDITOR_MACROS(PROG_LANGUAGE, LIBRARY_NAME, MACRO_NAME);           
CREATE CACHED TABLE PUBLIC.ACTION_PARENT(
    DOC_TYPE VARCHAR(100) NOT NULL,
    ACTION_NAME VARCHAR(100) NOT NULL,
    PARENT_ACTION VARCHAR(100) NOT NULL
);
-- 18 = SELECT COUNT(*) FROM PUBLIC.ACTION_PARENT;             
INSERT INTO PUBLIC.ACTION_PARENT(DOC_TYPE, ACTION_NAME, PARENT_ACTION) VALUES
('debaterecord', 'makePrayerMarkup', 'makePrayerSection'),
('debaterecord', 'makePaperMarkup', 'makePaperSection'),
('debaterecord', 'makePaperDetailsMarkup', 'makePaperSection'),
('debaterecord', 'makeNoticeOfMotionMarkup', 'makeNoticeOfMotionSection'),
('debaterecord', 'makeCommentsMarkup', 'makeSpeechBlockSection'),
('debaterecord', 'makeNoticeMarkup', 'makeNoticeOfMotionSection'),
('debaterecord', 'makeSpeechMarkup', 'makeSpeechBlockSection'),
('debaterecord', 'makeCommentsMarkup', 'makeNoticeOfMotionSection'),
('debaterecord', 'makeCommentsMarkup', 'makeQuestionBlockSection'),
('debaterecord', 'makeCommentsMarkup', 'makePaperSection'),
('debaterecord', 'makeCommentsMarkup', 'makePrayerSection'),
('debaterecord', 'makeSpeechBlockSection', 'makeQASection'),
('debaterecord', 'makeSpeechBlockSection', 'makeNoticeOfMotionSection'),
('debaterecord', 'makeQuestionBlockSection', 'makeQASection'),
('debaterecord', 'makeSpeechBlockSection', 'makeQuestionBlockSection'),
('debaterecord', 'makeQATitleMarkup', 'makeQASection'),
('debaterecord', 'makeQuestionTitleMarkup', 'makeQuestionBlockSection'),
('debaterecord', 'makeQuestionTextMarkup', 'makeQuestionBlockSection');      
CREATE PRIMARY KEY ON PUBLIC.ACTION_PARENT(DOC_TYPE, ACTION_NAME, PARENT_ACTION);              
CREATE INDEX PUBLIC.CONSTRAINT_5_INDEX_0 ON PUBLIC.ACTION_PARENT(ACTION_NAME); 
CREATE CACHED TABLE PUBLIC.DOCUMENT_METADATA(
    DOC_TYPE VARCHAR(100) NOT NULL,
    METADATA_NAME CHAR(50) NOT NULL,
    METADATA_DATATYPE CHAR(50) NOT NULL,
    METADATA_NAMESPACE CHAR(50),
    METADATA_TYPE CHAR(30),
    DISPLAY_ORDER INT,
    VISIBLE INT,
    DISPLAY_NAME CHAR(100)
);             
-- 52 = SELECT COUNT(*) FROM PUBLIC.DOCUMENT_METADATA;         
INSERT INTO PUBLIC.DOCUMENT_METADATA(DOC_TYPE, METADATA_NAME, METADATA_DATATYPE, METADATA_NAMESPACE, METADATA_TYPE, DISPLAY_ORDER, VISIBLE, DISPLAY_NAME) VALUES
('debaterecord', 'BungeniDocAuthor', 'string', 'bungeni', 'document', 5, 1, 'Author'),
('debaterecord', 'BungeniParliamentID', 'string', 'bungeni', 'document', 4, 0, 'Parliament ID'),
('debaterecord', 'BungeniDocType', 'string', 'bungeni', 'document', 1, 1, 'Document Type'),
('debaterecord', 'BungeniDebateOfficialDate', 'datetime', 'bungeni', 'document', 6, 1, 'Official Date'),
('debaterecord', 'BungeniDebateOfficialTime', 'datetime', 'bungeni', 'document', 7, 1, 'Official Time'),
('bill', 'BungeniBillNo', 'string', 'bungeni', 'document', 4, 1, 'Bill No'),
('bill', 'BungeniDateOfAssent', 'string', 'bungeni', 'document', 5, 1, 'Date of Assent'),
('bill', 'BungeniDateOfCommencement', 'string', 'bungeni', 'document', 6, 1, 'Date of Commencement'),
('bill', 'BungeniDocPart', 'string', 'bungeni', 'document', 11, 1, 'Document Part'),
('bill', 'BungeniBillOfficialDate', 'datetime', 'bungeni', 'document', 6, 1, 'Official Date'),
('bill', 'BungeniDocAuthor', 'string', 'bungeni', 'document', 5, 1, 'Author'),
('bill', 'BungeniLanguageCode', 'string', 'bungeni', 'document', 2, 1, 'Language ID'),
('bill', 'BungeniParliamentID', 'string', 'bungeni', 'document', 4, 1, 'Parliament ID'),
('bill', 'BungeniParliamentSession', 'string', 'bungeni', 'document', 8, 1, 'Parliament Session'),
('bill', 'BungeniParliamentSitting', 'string', 'bungeni', 'document', 9, 1, 'Parliament Sitting'),
('bill', 'BungeniWorkURI', 'string', 'bungeni', 'document', 7, 1, 'Work URI'),
('bill', 'BungeniExpURI', 'string', 'bungeni', 'document', 8, 1, 'Expression URI'),
('bill', 'BungeniManURI', 'string', 'bungeni', 'document', 10, 1, 'Manifestation URI'),
('bill', 'BungeniExpDate', 'string', 'bungeni', 'document', 12, 0, 'Expression Date'),
('bill', 'BungeniManDate', 'string', 'bungeni', 'document', 12, 0, 'Expression Date'),
('bill', 'BungeniPublicationDate', 'string', 'bungeni', 'document', 11, 0, 'Publication Date'),
('bill', 'BungeniWorkDate', 'string', 'bungeni', 'document', 10, 0, 'Work Date'),
('bill', 'BungeniCountryCode', 'string', 'bungeni', 'document', 3, 1, 'Country Code'),
('bill', 'BungeniPublicationName', 'string', 'bungeni', 'document', 13, 0, 'Publication Name'),
('bill', 'BungeniDocType', 'string', 'bungeni', 'document', 1, 0, 'Document Type'),
('bill', 'BungeniBillOfficialTime', 'datetime', 'bungeni', 'document', 7, 0, 'Official Time'),
('debaterecord', 'BungeniWorkDate', 'string', 'bungeni', 'document', 10, 1, 'Work Date'),
('debaterecord', 'BungeniDocPart', 'string', 'bungeni', 'document', 11, 1, 'Document Part'),
('debaterecord', 'BungeniPublicationDate', 'string', 'bungeni', 'document', 11, 1, 'Publication Date'),
('debaterecord', 'BungeniPublicationName', 'string', 'bungeni', 'document', 13, 1, 'Publication Name'),
('debaterecord', 'BungeniExpDate', 'string', 'bungeni', 'document', 12, 1, 'Expression Date'),
('debaterecord', 'BungeniManDate', 'string', 'bungeni', 'document', 12, 1, 'Expression Date'),
('judgement', 'BungeniCountryCode', 'string', 'bungeni', 'document', 3, 1, 'Country Code'),
('judgement', 'BungeniJudgementNo', 'string', 'bungeni', 'document', 2, 1, 'Judgement No'),
('judgement', 'BungeniCaseNo', 'string', 'bungeni', 'document', 3, 1, 'Case No'),
('judgement', 'BungeniDocAuthor', 'string', 'bungeni', 'document', 5, 1, 'Author'),
('judgement', 'BungeniDocPart', 'string', 'bungeni', 'document', 11, 1, 'Document Part'),
('judgement', 'BungeniDocType', 'string', 'bungeni', 'document', 1, 1, 'Document Type'),
('judgement', 'BungeniExpDate', 'string', 'bungeni', 'document', 12, 1, 'Expression Date'),
('judgement', 'BungeniLanguageCode', 'string', 'bungeni', 'document', 2, 1, 'Language ID'),
('judgement', 'BungeniManDate', 'string', 'bungeni', 'document', 12, 1, 'Expression Date'),
('judgement', 'BungeniParliamentID', 'string', 'bungeni', 'document', 4, 0, 'Parliament ID'),
('judgement', 'BungeniParliamentSession', 'string', 'bungeni', 'document', 8, 1, 'Parliament Session'),
('judgement', 'BungeniParliamentSitting', 'string', 'bungeni', 'document', 9, 1, 'Parliament Sitting');      
INSERT INTO PUBLIC.DOCUMENT_METADATA(DOC_TYPE, METADATA_NAME, METADATA_DATATYPE, METADATA_NAMESPACE, METADATA_TYPE, DISPLAY_ORDER, VISIBLE, DISPLAY_NAME) VALUES
('judgement', 'BungeniPublicationDate', 'string', 'bungeni', 'document', 11, 1, 'Publication Date'),
('judgement', 'BungeniPublicationName', 'string', 'bungeni', 'document', 13, 1, 'Publication Name'),
('judgement', 'BungeniWorkDate', 'string', 'bungeni', 'document', 10, 1, 'Work Date'),
('judgement', 'BungeniJudgementDate', 'datetime', 'bungeni', 'document', 4, 1, 'Judgement Date'),
('debaterecord', 'BungeniLanguageCode', 'string', 'bungeni', 'document', 2, 1, 'Language ID'),
('debaterecord', 'BungeniCountryCode', 'string', 'bungeni', 'document', 3, 1, 'Country Code'),
('debaterecord', 'BungeniParliamentSession', 'string', 'bungeni', 'document', 8, 1, 'Parliament Session'),
('debaterecord', 'BungeniParliamentSitting', 'string', 'bungeni', 'document', 9, 1, 'Parliament Sitting');        
CREATE PRIMARY KEY ON PUBLIC.DOCUMENT_METADATA(DOC_TYPE, METADATA_NAME);       
CREATE CACHED TABLE PUBLIC.FORM_COMMAND_CHAIN(
    FORM_NAME VARCHAR(100) NOT NULL,
    FORM_MODE VARCHAR(50) NOT NULL,
    COMMAND_CATALOG VARCHAR(100) NOT NULL,
    COMMAND_CHAIN VARCHAR(100) NOT NULL
);  
-- 14 = SELECT COUNT(*) FROM PUBLIC.FORM_COMMAND_CHAIN;        
INSERT INTO PUBLIC.FORM_COMMAND_CHAIN(FORM_NAME, FORM_MODE, COMMAND_CATALOG, COMMAND_CHAIN) VALUES
('org.bungeni.editor.selectors.InitQuestionBlock', 'TEXT_INSERTION', 'debaterecord', 'debateRecordFullInsertQuestionBlock'),
('org.bungeni.editor.selectors.InitQuestionBlock', 'TEXT_EDIT', 'debaterecord', 'debateRecordFullEditQuestionBlock'),
('org.bungeni.editor.selectors.InitPapers', 'TEXT_INSERTION', 'debaterecord', 'debateRecordFullInsertPapers'),
('org.bungeni.editor.selectors.InitPapers', 'TEXT_EDIT', 'debaterecord', 'debateRecordFullEditPapers'),
('org.bungeni.editor.selectors.InitPapers', 'TEXT_SELECTED_EDIT', 'debaterecord', 'from_subaction'),
('org.bungeni.editor.selectors.InitPapers', 'TEXT_SELECTED_INSERT', 'debaterecord', 'from_subaction'),
('org.bungeni.editor.selectors.InitDebateRecord', 'TEXT_INSERTION', 'debaterecord', 'debateRecordFullInsertMasthead'),
('org.bungeni.editor.selectors.InitDebateRecord', 'TEXT_EDIT', 'debaterecord', 'debateRecordFullEditMasthead'),
('org.bungeni.editor.selectors.InitDebateRecord', 'TEXT_SELECTED_EDIT', 'debaterecord', 'debateRecordFullSelectedEditMasthead'),
('org.bungeni.editor.selectors.InitDebateRecord', 'TEXT_SELECTED_INSERT', 'debaterecord', 'debateRecordFullSelectedInsertMasthead'),
('org.bungeni.editor.selectors.InitQAsection', 'TEXT_INSERTION', 'debaterecord', 'debateRecordFullInsertQA'),
('org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordDate', 'TEXT_INSERTION', 'debaterecord', 'debareRecordDateFullInsert'),
('org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordTime', 'TEXT_INSERTION', 'debaterecord', 'debateRecordTimeFullInsert'),
('org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordLogo', 'TEXT_INSERTION', 'debaterecord', 'debateRecordLogoFullInsert'); 
CREATE PRIMARY KEY ON PUBLIC.FORM_COMMAND_CHAIN(FORM_NAME, FORM_MODE);         
CREATE CACHED TABLE PUBLIC.FORM_CATALOG_SOURCE(
    FORM_NAME VARCHAR(100) NOT NULL,
    CATALOG_SOURCE VARCHAR(255) NOT NULL
);               
-- 4 = SELECT COUNT(*) FROM PUBLIC.FORM_CATALOG_SOURCE;        
INSERT INTO PUBLIC.FORM_CATALOG_SOURCE(FORM_NAME, CATALOG_SOURCE) VALUES
('org.bungeni.editor.selectors.InitQuestionBlock', 'settings/command_chains/commandChain.xml'),
('org.bungeni.editor.selectors.InitPapers', 'settings/command_chains/commandChain.xml'),
('org.bungeni.editor.selectors.InitDebateRecord', 'settings/command_chains/commandChain.xml'),
('org.bungeni.editor.selectors.InitQAsection', 'settings/command_chains/commandChain.xml');   
CREATE PRIMARY KEY ON PUBLIC.FORM_CATALOG_SOURCE(FORM_NAME);   
CREATE CACHED TABLE PUBLIC.LOCALIZED_DISPLAY_STRINGS(
    STRING_KEY VARCHAR(50) NOT NULL,
    LANG_CODE VARCHAR(2) NOT NULL,
    DISPLAY_STRING VARCHAR(255) NOT NULL
);      
-- 1 = SELECT COUNT(*) FROM PUBLIC.LOCALIZED_DISPLAY_STRINGS;  
INSERT INTO PUBLIC.LOCALIZED_DISPLAY_STRINGS(STRING_KEY, LANG_CODE, DISPLAY_STRING) VALUES
('dispBlockActions', 'en', 'Block Actions');        
CREATE PRIMARY KEY ON PUBLIC.LOCALIZED_DISPLAY_STRINGS(STRING_KEY, LANG_CODE); 
CREATE CACHED TABLE PUBLIC.TOOLBAR_MENU_GROUPS(
    GROUP_NAME VARCHAR(50) NOT NULL,
    DISPLAY_STRING_KEY VARCHAR(50) NOT NULL
);            
-- 1 = SELECT COUNT(*) FROM PUBLIC.TOOLBAR_MENU_GROUPS;        
INSERT INTO PUBLIC.TOOLBAR_MENU_GROUPS(GROUP_NAME, DISPLAY_STRING_KEY) VALUES
('blockActions', 'dispBlockActions');            
CREATE PRIMARY KEY ON PUBLIC.TOOLBAR_MENU_GROUPS(GROUP_NAME);  
CREATE CACHED TABLE PUBLIC.TOOLBAR_MENU_ACTION_BLOCKS(
    BLOCK_NAME VARCHAR(50) NOT NULL,
    STRING_KEY VARCHAR(50) NOT NULL,
    ACTION_MODE VARCHAR(50) NOT NULL,
    TARGET VARCHAR(100) NOT NULL
);     
-- 0 = SELECT COUNT(*) FROM PUBLIC.TOOLBAR_MENU_ACTION_BLOCKS; 
CREATE PRIMARY KEY ON PUBLIC.TOOLBAR_MENU_ACTION_BLOCKS(BLOCK_NAME);           
CREATE CACHED TABLE PUBLIC.CONDITIONAL_OPERATORS(
    CONDITION_NAME CHAR(10) NOT NULL,
    CONDITION_SYNTAX CHAR(10) NOT NULL,
    CONDITION_CLASS VARCHAR(100) NOT NULL
);   
-- 2 = SELECT COUNT(*) FROM PUBLIC.CONDITIONAL_OPERATORS;      
INSERT INTO PUBLIC.CONDITIONAL_OPERATORS(CONDITION_NAME, CONDITION_SYNTAX, CONDITION_CLASS) VALUES
('and', ':and:', 'org.bungeni.editor.toolbar.conditions.operators.andOperator'),
('or', ':or:', 'org.bungeni.editor.toolbar.conditions.operators.orOperator');              
CREATE PRIMARY KEY ON PUBLIC.CONDITIONAL_OPERATORS(CONDITION_NAME);            
CREATE CACHED TABLE PUBLIC.TOOLBAR_CONDITIONS(
    DOCTYPE VARCHAR(50) NOT NULL,
    CONDITION_NAME CHAR(20) NOT NULL,
    CONDITION_CLASS CHAR(100) NOT NULL
);               
-- 27 = SELECT COUNT(*) FROM PUBLIC.TOOLBAR_CONDITIONS;        
INSERT INTO PUBLIC.TOOLBAR_CONDITIONS(DOCTYPE, CONDITION_NAME, CONDITION_CLASS) VALUES
('debaterecord', 'fieldNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldNotExists'),
('debaterecord', 'fieldExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldExists'),
('bill', 'sectionHasChildType', 'org.bungeni.editor.toolbar.conditions.runnable.sectionHasChildType'),
('debaterecord', 'sectionExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionExists'),
('debaterecord', 'sectionNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionNotExists'),
('debaterecord', 'textSelected', 'org.bungeni.editor.toolbar.conditions.runnable.textSelected'),
('debaterecord', 'cursorInSection', 'org.bungeni.editor.toolbar.conditions.runnable.cursorInSection'),
('debaterecord', 'imageSelected', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelected'),
('debaterecord', 'imageSelectedIsNot', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelectedIsNot'),
('bill', 'fieldNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldNotExists'),
('bill', 'fieldExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldExists'),
('bill', 'sectionExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionExists'),
('bill', 'sectionNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionNotExists'),
('bill', 'textSelected', 'org.bungeni.editor.toolbar.conditions.runnable.textSelected'),
('bill', 'cursorInSection', 'org.bungeni.editor.toolbar.conditions.runnable.cursorInSection'),
('bill', 'imageSelected', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelected'),
('bill', 'imageSelectedIsNot', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelectedIsNot'),
('debaterecord', 'cursorInSectionType', 'org.bungeni.editor.toolbar.conditions.runnable.cursorInSectionType'),
('judgement', 'cursorInSection', 'org.bungeni.editor.toolbar.conditions.runnable.cursorInSection'),
('judgement', 'cursorInSectionType', 'org.bungeni.editor.toolbar.conditions.runnable.cursorInSectionType'),
('judgement', 'fieldExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldExists'),
('judgement', 'fieldNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.fieldNotExists'),
('judgement', 'imageSelected', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelected'),
('judgement', 'imageSelectedIsNot', 'org.bungeni.editor.toolbar.conditions.runnable.imageSelectedIsNot'),
('judgement', 'sectionExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionExists'),
('judgement', 'sectionNotExists', 'org.bungeni.editor.toolbar.conditions.runnable.sectionNotExists'),
('judgement', 'textSelected', 'org.bungeni.editor.toolbar.conditions.runnable.textSelected');       
CREATE PRIMARY KEY ON PUBLIC.TOOLBAR_CONDITIONS(DOCTYPE, CONDITION_NAME);      
CREATE CACHED TABLE PUBLIC.SUB_ACTION_SETTINGS(
    DOC_TYPE VARCHAR(100) NOT NULL,
    PARENT_ACTION_NAME VARCHAR(100) NOT NULL,
    SUB_ACTION_NAME VARCHAR(100) NOT NULL,
    SUB_ACTION_ORDER INT NOT NULL,
    SUB_ACTION_STATE INT NOT NULL,
    ACTION_TYPE VARCHAR(50),
    ACTION_DISPLAY_TEXT VARCHAR(100),
    ACTION_FIELDS VARCHAR(100),
    ACTION_CLASS VARCHAR(70),
    SYSTEM_CONTAINER VARCHAR(50),
    VALIDATOR_CLASS CHAR(100),
    ROUTER_CLASS VARCHAR(100),
    DIALOG_CLASS VARCHAR(100),
    COMMAND_CHAIN VARCHAR(100)
);           
-- 73 = SELECT COUNT(*) FROM PUBLIC.SUB_ACTION_SETTINGS;       
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('bill', 'makeBillArticleSection', 'apply_numbered_heading', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillClauseSection', 'apply_numbered_heading', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeQuestionBlockSection', 'section_creation', 1, 1, 'section_create', 'Create Question Block', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitQuestionBlock', ''),
('debaterecord', 'makeQASection', 'section_creation', 1, 1, 'section_create', 'Create QA Section', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.validateCreateSection', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitQASection', ''),
('debaterecord', 'makeDebateSpeechBlockSection', 'speech_as', 1, 1, 'speech_as', 'create speech as reference', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSpeechAsReference', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateSpeechBlockSection', 'lock', 1, 1, 'lock', 'lock heading', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateHeadingLock', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateSpeechBlockSection', 'unlockHead', 1, 1, 'unlock', 'unlock heading ', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateHeadingUnlock', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makePaperSection', 'import_tabled_documents', 2, 1, 'field_action', 'Import tabled documents', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerTabledDocuments', 'org.bungeni.editor.selectors.InitPapers', 'debaterecord:importTabledDocuments'),
('debaterecord', 'makePrayerSection', 'section_creation', 0, 1, 'section_create', 'Create emtpy masthead', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.validateCreateSection', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitDebateRecord', ''),
('debaterecord', 'makePrayerSection', 'debatedate_entry', 1, 1, 'field_action', 'Markup debate date', 'dt:initdebate_hansarddate', 'org.bungeni.editor.actions.EditorSelectionActionHandler', 'int:masthead_datetime', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateDateEntry', 'org.bungeni.editor.selectors.InitDebateRecord', ''),
('debaterecord', 'general_action', 'create_root_section', 1, 1, 'root_create', 'create root section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateRoot', '', '');
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('debaterecord', 'makePrayerSection', 'markup_logo', 3, 1, 'field_action', 'Apply logo', 'btn:initdebate_selectlogo', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMarkupLogo', 'org.bungeni.editor.selectors.InitDebateRecord', ''),
('debaterecord', 'makePrayerSection', 'debatetime_entry', 2, 1, 'field_action', 'Markup debate time', 'dt:initdebate_timeofhansard', 'org.bungeni.editor.actions.EditorSelectionActionHandler', 'int:masthead_datetime', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateTimeEntry', 'org.bungeni.editor.selectors.InitDebateRecord', ''),
('debaterecord', 'makePaperSection', 'section_creation', 0, 1, 'section_create', 'Create empty Paper Section', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.validateCreateSection', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitPapers', ''),
('debaterecord', 'makePaperSection', 'apply_style', 1, 1, 'markup', 'Apply papers style', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerApplyStyle', 'org.bungeni.editor.selectors.InitPapers', ''),
('debaterecord', 'makeDebateMastheadSection', 'create_root_section', 1, 1, 'create_root', 'createroot section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateRoot', '', ''),
('bill', 'makeBillPrefaceSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillClauseSection', 'section_creation', 1, 1, 'section_create', 'dummy', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ' '),
('bill', 'makeBillArticleSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillPartSection', 'section_creation', 1, 1, 'section_create', 'dummy', ' ', 'org.bungeni.editor.actions.EditorSelectionActionHandler', ' ', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ' '),
('bill', 'makeBillPartSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSectionSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', '.'),
('bill', 'makeBillSectionSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', '');              
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('bill', 'makeBillChapterSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSubChapterSection', 'section_creation', 1, 1, 'section_create', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillParaSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSubParaSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSubSectionSection', 'section_creation', 1, 1, 'section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillChapterSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillParaSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillSubParaSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillSubChapterSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dum', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillSubSectionSection', 'apply_numbered_heading', 1, 1, 'apply_numbered_heading', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateNumberedHeading', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillChapterSection', 'composite_section_creation', 1, 1, 'composite_section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateCompositeSection', 'org.bungeni.editor.selectors.InitBillPreface', '');               
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('bill', 'makeBillSubChapterSection', 'composite_section_creation', 1, 1, 'composite_section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateCompositeSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSectionSection', 'composite_section_creation', 1, 1, 'composite_section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateCompositeSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('bill', 'makeBillSubSectionSection', 'composite_section_creation', 1, 1, 'composite_section_create', 'dummy', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateCompositeSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeDebateMastheadSection', 'section_creation', 1, 1, 'section_create', 'create masthead section', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMastheadSection', 'debatedate', 1, 1, 'debatedate', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateRecordDateEntry', 'org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordDate', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMastheadSection', 'debatetime', 1, 1, 'debatetime', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateRecordTimeEntry', 'org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordTime', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMastheadSection', 'markup_logo', 1, 1, 'debatelogo', 'dummy', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMarkupLogo', 'org.bungeni.editor.selectors.debaterecord.masthead.DebateRecordLogo', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateQuestionBlockSection', 'section_creation', 1, 1, 'section_create', 'creates a section for the question block', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateRecordSelectQuestion', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateQuestionBlockSection', 'markup_question_no', 1, 1, 'markup_reference', 'mark a block of text as a question reference', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateQuestionReference', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateQuestionSection', 'section_creation', 1, 1, 'section_create', '', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', '');        
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('debaterecord', 'makeDebateQuestionGroupSection', 'section_creation', 1, 1, 'section_create', STRINGDECODE('\u00a0'), STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateQuestionBlockSection', 'markup_question_by', 1, 1, 'markup_reference', 'mark a block of text as a question by reference', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateQuestionByReference', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', ''),
('debaterecord', 'makeDebateQuestionBlockSection', 'markup_question_to', 1, 1, 'markup_reference', 'mark a block of text as a question to reference', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateQuestionToReference', 'org.bungeni.editor.selectors.debaterecord.question.QuestionSelect', ''),
('debaterecord', 'makeDebateQuestionBlockSection', 'apply_questiontext_style', 1, 1, 'apply_style', 'mark the selected text with a style', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerApplyStyle', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeDebateSpeechBlockSection', 'section_creation', 1, 1, 'section_create', 'create a speech section', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerDebateRecordSelectSpeech', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateSpeechBlockSection', 'speech_by', 1, 1, 'speech_by', 'create speech to reference', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSpeechByReference', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeObservationAction', 'section_creation', 1, 1, 'section_create', 'create an observation section', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateObservation', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('debaterecord', 'makeGroupActivityAction', 'section_creation', 1, 1, 'section_create', 'create a group activity section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeCommunicationAction', 'section_creation', 1, 1, 'section_create', 'create a communication section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeAdjournmentAction', 'mark_as_action', 1, 1, 'mark_as_action', 'crearte an action event', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMarkAsAction', 'org.bungeni.editor.selectors.InitBillPreface', '');              
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('debaterecord', 'makeConclusionSection', 'section_creation', 1, 1, 'section_create', 'create a conclusion section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeConclusionSection', 'mark_house_closing', 1, 1, 'mark_house_closing', 'create a house closing time reference', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMarkHouseClosing', 'org.bungeni.editor.selectors.debaterecord.conclusion.HouseClosingTime', STRINGDECODE('\u00a0')),
('debaterecord', 'makeNoticeOfMotionAction', 'mark_as_action', 1, 1, 'mark_as_action', 'create an action event', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMarkAsAction', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeMetadataReference', 'mark', 1, 1, 'mark', 'create a document metadata reference', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateUniqueReference', 'org.bungeni.editor.selectors.InitBillPreface', STRINGDECODE('\u00a0')),
('bill', 'makeBillGeneralAction', 'create_sidenote', 1, 1, 'sidenote_create', 'create sidenote', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSidenote', 'org.bungeni.editor.actions.routers.routerCreateSideNote_panel', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMotionBlockSection', 'markup_motion_title', 1, 1, 'mark_as_title', 'create a motion title', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerApplyStyle', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeDebateMotionGroupSection', 'section_creation', 1, 1, 'section_create', 'create motion container ', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makePapersLaidBlockSection', 'section_creation', 1, 1, 'section_create', 'create a papers laid container', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', STRINGDECODE('\u00a0')),
('debaterecord', 'makePapersLaidBlockSection', 'markup_papers_heading', 1, 1, 'apply_style', 'create a papers heading', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerApplyStyle', '', STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMastheadSection', 'markup_preface_heading', 1, 1, 'apply_style', 'create a papers heading', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerApplyStyle', 'org.bungeni.editor.selectors.InitBillPreface', ''),
('debaterecord', 'makeDebateMotionBlockSection', 'section_creation', 1, 1, 'section_create', 'create a motion section', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerMotionSelectMotion', STRINGDECODE('\u00a0org.bungeni.editor.selectors.debaterecord.motions.MotionSelect'), STRINGDECODE('\u00a0'));             
INSERT INTO PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME, SUB_ACTION_ORDER, SUB_ACTION_STATE, ACTION_TYPE, ACTION_DISPLAY_TEXT, ACTION_FIELDS, ACTION_CLASS, SYSTEM_CONTAINER, VALIDATOR_CLASS, ROUTER_CLASS, DIALOG_CLASS, COMMAND_CHAIN) VALUES
('debaterecord', 'makePapersLaidBlockSection', 'select_documents', 1, 1, 'select_documents', 'select documents', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.EditorSelectionActionHandler', STRINGDECODE('\u00a0'), 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerTabledDocuments', 'org.bungeni.editor.selectors.debaterecord.tableddocuments.TabledDocuments', STRINGDECODE('\u00a0')),
('debaterecord', 'makePapersLaidListSection', 'section_creation', 1, 1, 'section_create', 'create papers list section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', ''),
('judgement', 'makeJudgementHeader', 'section_creation', 1, 1, 'section_create', 'create judgement header section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', ''),
('judgement', 'makeMetadataReference', 'mark', 1, 1, 'mark', 'create a document metadata reference', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateUniqueReference', '', ''),
('judgement', 'makeMotivation', 'section_creation', 1, 1, 'section_create', 'create judgement header section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', ''),
('judgement', 'makeDecision', 'section_creation', 1, 1, 'section_create', 'create judgement header section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', ''),
('judgement', 'makeBackground', 'section_creation', 1, 1, 'section_create', 'create judgement header section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', ''),
('judgement', 'makeConclusion', 'section_creation', 1, 1, 'section_create', 'create judgement header section', '', 'org.bungeni.editor.actions.EditorSelectionActionHandler', '', 'org.bungeni.editor.actions.validators.defaultValidator', 'org.bungeni.editor.actions.routers.routerCreateSection', '', '');       
CREATE PRIMARY KEY ON PUBLIC.SUB_ACTION_SETTINGS(DOC_TYPE, PARENT_ACTION_NAME, SUB_ACTION_NAME);               
CREATE INDEX PUBLIC.SUBACTIONORDER_IDX ON PUBLIC.SUB_ACTION_SETTINGS(SUB_ACTION_ORDER);        
CREATE CACHED TABLE PUBLIC.DIALOG_CLASSES(
    DIALOG_CLASS CHAR(100) NOT NULL
);              
-- 5 = SELECT COUNT(*) FROM PUBLIC.DIALOG_CLASSES;             
INSERT INTO PUBLIC.DIALOG_CLASSES(DIALOG_CLASS) VALUES
('org.bungeni.editor.selectors.InitDebateRecord'),
('org.bungeni.editor.selectors.InitPapers'),
('org.bungeni.editor.selectors.InitQASection'),
('org.bungeni.editor.selectors.InitQuestionBlock'),
('org.bungeni.editor.selectors.InitSpeech');        
CREATE PRIMARY KEY ON PUBLIC.DIALOG_CLASSES(DIALOG_CLASS);     
CREATE CACHED TABLE PUBLIC.ACTION_SETTINGS(
    DOC_TYPE VARCHAR(100) NOT NULL,
    ACTION_NAME VARCHAR(100) NOT NULL,
    ACTION_ORDER INT NOT NULL,
    ACTION_STATE INT NOT NULL,
    ACTION_CLASS VARCHAR(200),
    ACTION_TYPE VARCHAR(50),
    ACTION_NAMING_CONVENTION VARCHAR(100),
    ACTION_NUMBERING_CONVENTION VARCHAR(50),
    ACTION_PARENT VARCHAR(50),
    ACTION_ICON VARCHAR(50),
    ACTION_DISPLAY_TEXT VARCHAR(100),
    ACTION_DIMENSION VARCHAR(50),
    ACTION_SECTION_TYPE CHAR(50),
    ACTION_EDIT_DLG_ALLOWED INT DEFAULT 0,
    ACTION_DIALOG_CLASS CHAR(100)
); 
-- 51 = SELECT COUNT(*) FROM PUBLIC.ACTION_SETTINGS;           
INSERT INTO PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME, ACTION_ORDER, ACTION_STATE, ACTION_CLASS, ACTION_TYPE, ACTION_NAMING_CONVENTION, ACTION_NUMBERING_CONVENTION, ACTION_PARENT, ACTION_ICON, ACTION_DISPLAY_TEXT, ACTION_DIMENSION, ACTION_SECTION_TYPE, ACTION_EDIT_DLG_ALLOWED, ACTION_DIALOG_CLASS) VALUES
('bill', 'makeBillSectionSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'section', 'serial', 'parent', '', 'dummy', '', 'Section', 1, ''),
('debaterecord', 'makePrayerMarkup', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'prayer', 'none', 'makePrayerSection', ' ', 'Markup as Prayer', ' ', 'MastHead', 0, NULL),
('debaterecord', 'makePaperMarkup', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'papers', 'none', 'makePaperSection', ' ', 'Markup as Paper', ' ', '', 0, NULL),
('debaterecord', 'makePaperDetailsMarkup', 2, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'paper-details', 'none', 'makePaperSection', ' ', 'Markup as Paper Details', ' ', '', 0, NULL),
('debaterecord', 'general_action', 0, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'debaterecord', 'none', STRINGDECODE('\u00a0'), STRINGDECODE('\u00a0'), 'place holder for general action', STRINGDECODE('\u00a0'), 'None', 0, NULL),
('debaterecord', 'makeSpeechBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'speech', 'serial', 'makeQASection', ' ', 'Speech Section', ' ', 'Speech', 1, NULL),
('debaterecord', 'makeQuestionBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'question', 'serial', 'makeQASection', 'makeQASection', 'Create a numbered Question Section', ' ', 'QuestionContainer', 1, NULL),
('debaterecord', 'makeQuestionTextMarkup', 2, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'question-text', 'none', 'makeQuestionBlockSection', '', 'Markup as Question Text', '', '', 0, NULL),
('debaterecord', 'makeQuestionTitleMarkup', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'question-title', 'none', 'makeQuestionBlockSection', ' ', 'Markup as Question Title', ' ', '', 0, NULL),
('debaterecord', 'makeSpeechMarkup', 2, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'speech-text', 'none', 'makeQuestionBlockSection', ' ', 'Markup as Speech', ' ', '', 0, NULL),
('debaterecord', 'makeQATitleMarkup', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'qa-title', 'none', 'makeQASection', '', 'Markup as QA Title', '', '', 0, NULL),
('debaterecord', 'makeNoticeMarkup', 2, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'notice', 'none', 'makeNoticeOfMotionSection', ' ', 'Markup as Notice', ' ', '', 0, NULL),
('debaterecord', 'makeNoticeDetailsMarkup', 3, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'notice-details', 'none', 'makeNoticeDetailsMarkup', '', 'Markup as Notice Details', '', '', 0, NULL),
('debaterecord', 'makeNoticeOfMotionMarkup', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'markup', 'notice-of-motion', 'none', 'makeNoticeOfMotionSection', '', 'Markup as Notice-of-Motion', '', '', 0, NULL),
('debaterecord', 'makePaperSection', 2, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'papers', 'single', 'parent', ' ', 'Create a Paper Section', ' ', 'Paper', 0, 'org.bungeni.editor.selectors.InitPapers'),
('debaterecord', 'makePrayerSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'masthead', 'single', 'parent', ' ', 'Create a Preface', ' ', 'MastHead', 1, 'org.bungeni.editor.selectors.InitDebateRecord'),
('debaterecord', 'makeQASection', 4, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'qa', 'serial', 'parent', ' ', 'Create a Question-Answer section', ' ', 'QAContainer', 0, 'org.bungeni.editor.selectors.InitQAsection'),
('debaterecord', 'makeNoticeOfMotionSection', 3, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'notice-of-motion', 'single', 'parent', ' ', 'Create a Notice of Motion Section', ' ', 'NoticeOfMotion', 0, NULL);   
INSERT INTO PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME, ACTION_ORDER, ACTION_STATE, ACTION_CLASS, ACTION_TYPE, ACTION_NAMING_CONVENTION, ACTION_NUMBERING_CONVENTION, ACTION_PARENT, ACTION_ICON, ACTION_DISPLAY_TEXT, ACTION_DIMENSION, ACTION_SECTION_TYPE, ACTION_EDIT_DLG_ALLOWED, ACTION_DIALOG_CLASS) VALUES
('bill', 'makeBillPrefaceSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'preface', 'single', 'parent', '', 'dummy', '', 'MastHead', 1, ''),
('bill', 'makeBillArticleSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'article', 'serial', 'parent', '', 'dummy', '', 'Article', 1, 'null'),
('bill', 'makeBillClauseSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'clause', 'serial', 'parent', '', 'dummy', '', 'Clause', 1, ''),
('bill', 'makeBillPartSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'part', 'serial', 'parent', '', 'dummy', '', 'Part', 1, ''),
('bill', 'makeBillChapterSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'chapter', 'serial', 'parent', '', 'dummy', '', 'Chapter', 1, ''),
('bill', 'makeBillSubChapterSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'subchapter', 'serial', 'parent', STRINGDECODE('\u00a0'), 'dummy', STRINGDECODE('\u00a0'), 'SubChapter', 1, STRINGDECODE('\u00a0')),
('bill', 'makeBillParaSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'para', 'serial', 'parent', STRINGDECODE('\u00a0'), 'dummy', STRINGDECODE('\u00a0'), 'Paragraph', 1, STRINGDECODE('\u00a0')),
('bill', 'makeBillSubParaSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'subpara', 'serial', 'parent', STRINGDECODE('\u00a0'), 'dummy', STRINGDECODE('\u00a0'), 'SubParagraph', 1, STRINGDECODE('\u00a0')),
('bill', 'makeBillSubSectionSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'subsection', 'serial', 'parent', STRINGDECODE('\u00a0'), 'dummy', STRINGDECODE('\u00a0'), 'SubSection', 1, STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateMastheadSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'masthead', 'single', 'parent', STRINGDECODE('\u00a0'), 'Metadata for the Preface', STRINGDECODE('\u00a0'), 'MastHead', 1, 'org.bungeni.editor.selectors.debaterecord.masthead.Main'),
('bill', 'makeBillGeneralAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'gen', 'serial', 'parent', '', 'General Action', '', '', 1, ''),
('debaterecord', 'makeDebateQuestionSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'sque', 'serial', 'parent', STRINGDECODE('\u00a0'), 'marks up the actual question text', STRINGDECODE('\u00a0'), 'Question', 1, STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateQuestionBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'qa', 'serial', 'parent', STRINGDECODE('\u00a0'), 'contains a question and related speeches', STRINGDECODE('\u00a0'), 'QuestionAnswer', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeDebateQuestionGroupSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'questions', 'serial', 'parent', STRINGDECODE('\u00a0'), STRINGDECODE('creates \u00a0a question group'), STRINGDECODE('\u00a0'), 'QuestionsContainer', 1, STRINGDECODE('\u00a0')),
('debaterecord', 'makeDebateSpeechBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'speech', 'serial', 'parent', STRINGDECODE('\u00a0'), 'creates a speech', STRINGDECODE('\u00a0'), 'Speech', 1, 'org.bungeni.editor.selectors.debaterecord.speech.Main'),
('debaterecord', 'makeObservationAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'comment', 'serial', 'parent', '', 'creates an observation', '', 'Observation', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeGroupActivityAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'comment', 'serial', 'parent', STRINGDECODE('\u00a0'), 'creates a communication', STRINGDECODE('\u00a0'), 'GroupActivity', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main');              
INSERT INTO PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME, ACTION_ORDER, ACTION_STATE, ACTION_CLASS, ACTION_TYPE, ACTION_NAMING_CONVENTION, ACTION_NUMBERING_CONVENTION, ACTION_PARENT, ACTION_ICON, ACTION_DISPLAY_TEXT, ACTION_DIMENSION, ACTION_SECTION_TYPE, ACTION_EDIT_DLG_ALLOWED, ACTION_DIALOG_CLASS) VALUES
('debaterecord', 'makeCommunicationAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'comnctn', 'serial', 'parent', STRINGDECODE('\u00a0'), 'creates a communication', STRINGDECODE('\u00a0'), 'Communication', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeAdjournmentAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'actionevt', 'serial', 'parent', '', 'creates an adjournment section', '', 'ActionEvent', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeConclusionSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'concl', 'serial', 'parent', STRINGDECODE('\u00a0'), 'Conclusion Actions', STRINGDECODE('\u00a0'), 'Conclusion', 1, 'org.bungeni.editor.selectors.debaterecord.conclusion.Main'),
('debaterecord', 'makeNoticeOfMotionAction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'actionevt', 'serial', 'parent', '', 'creates a notice of motion', '', 'ActionEvent', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeMetadataReference', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'dummy', 'serial', 'parent', '', 'placeholder for metadata markup', '', 'ActionEvent', 1, 'org.bungeni.editor.selectors.debaterecord.question.Main'),
('debaterecord', 'makeDebateMotionGroupSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'allmotions', 'serial', 'parent', '', 'Create a Motion Group Section', '', 'MotionsContainer', 1, ''),
('debaterecord', 'makeDebateMotionBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'motion', 'serial', 'parent', STRINGDECODE('\u00a0'), 'Create Motion Section', STRINGDECODE('\u00a0'), 'Motion', 1, 'org.bungeni.editor.selectors.debaterecord.motions.Main'),
('debaterecord', 'makePapersLaidBlockSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'papers', 'serial', 'parent', STRINGDECODE('\u00a0'), 'Import Tabled Documents', STRINGDECODE('\u00a0'), 'TabledDocuments', 1, 'org.bungeni.editor.selectors.debaterecord.tableddocuments.Main'),
('debaterecord', 'makePapersLaidListSection', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'tbldocs', 'serial', 'parent', STRINGDECODE('\u00a0'), 'Import Tabled Documents', STRINGDECODE('\u00a0'), 'TabledDocumentsList', 1, 'org.bungeni.editor.selectors.debaterecord.tableddocuments.Main'),
('judgement', 'makeJudgementHeader', 1, 1, 'org.bungeni.editor.actions.EditorActionHander', 'section', 'header', 'single', 'parent', '', '', '', 'Header', 1, ''),
('judgement', 'makeMetadataReference', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'dummy', 'serial', 'parent', '', 'placeholder for metadata markup', '', 'ActionEvent', 1, 'org.bungeni.editor.selectors.debaterecod.question.Main'),
('judgement', 'makeIntroduction', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'intro', 'single', 'parent', STRINGDECODE('\u00a0'), STRINGDECODE('\u00a0'), STRINGDECODE('\u00a0'), 'Introduction', 1, STRINGDECODE('\u00a0')),
('judgement', 'makeBackground', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'bg', 'single', 'parent', '', '', '', 'Background', 1, ''),
('judgement', 'makeMotivation', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'motive', 'single', 'parent', '', '', '', 'Motivation', 1, ''),
('judgement', 'makeDecision', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'decision', 'single', 'parent', '', '', '', 'Decision', 1, ''),
('judgement', 'makeConclusion', 1, 1, 'org.bungeni.editor.actions.EditorActionHandler', 'section', 'concl', 'single', 'parent', '', '', '', 'Conclusion', 1, '');              
CREATE PRIMARY KEY ON PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME);           
CREATE INDEX PUBLIC.TAS_ACTIONPARENT_IDX ON PUBLIC.ACTION_SETTINGS(ACTION_PARENT);             
CREATE INDEX PUBLIC.CONSTRAINT_INDEX_0 ON PUBLIC.ACTION_SETTINGS(ACTION_SECTION_TYPE);         
CREATE CACHED TABLE PUBLIC.ACTION_MODES(
    DOC_TYPE VARCHAR(100) NOT NULL,
    ACTION_NAME VARCHAR(100) NOT NULL,
    ACTION_MODE VARCHAR(20) NOT NULL,
    MODE_HIDDEN_FIELD VARCHAR(100) NOT NULL,
    SUB_ACTION_NAME CHAR(50) NOT NULL,
    CONTROL_MODE CHAR(10)
);     
-- 22 = SELECT COUNT(*) FROM PUBLIC.ACTION_MODES;              
INSERT INTO PUBLIC.ACTION_MODES(DOC_TYPE, ACTION_NAME, ACTION_MODE, MODE_HIDDEN_FIELD, SUB_ACTION_NAME, CONTROL_MODE) VALUES
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'lbl_question_text', 'none', 'hidden'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'btn_select_question', 'none', 'hidden'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'txt_question_to', 'none', 'readonly'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'txt_person_uri', 'none', 'readonly'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'txt_question_text', 'none', 'readonly'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'txt_question_title', 'none', 'readonly'),
('debaterecord', 'makeQuestionBlockSection', 'TEXT_EDIT', 'scroll_question_text', 'none', 'hidden'),
('debaterecord', 'makePaperSection', 'TEXT_SELECTED_INSERT', 'txt_initpapers_title', 'import_tabled_documents', 'hidden'),
('debaterecord', 'makePaperSection', 'TEXT_SELECTED_INSERT', 'lbl_initpapers_title', 'import_tabled_documents', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'dt_initdebate_timeofhansard', 'debatedate_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'dt_initdebate_hansarddate', 'debatetime_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'lbl_initdebate_timeofhansard', 'debatedate_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'lbl_initdebate_hansarddate', 'debatetime_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'txt_initdebate_selectlogo', 'debatetime_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'lbl_initdebate_selectlogo', 'debatetime_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_EDIT', 'btn_initdebate_selectlogo', 'none', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_EDIT', 'txt_initdebate_selectlogo', 'none', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_EDIT', 'lbl_initdebate_selectlogo', 'none', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'lbl_initdebate_selectlogo', 'debatedate_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'txt_initdebate_selectlogo', 'debatedate_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'btn_initdebate_selectlogo', 'debatedate_entry', 'hidden'),
('debaterecord', 'makePrayerSection', 'TEXT_SELECTED_INSERT', 'btn_initdebate_selectlogo', 'debatetime_entry', 'hidden');   
CREATE PRIMARY KEY ON PUBLIC.ACTION_MODES(DOC_TYPE, ACTION_NAME, ACTION_MODE, MODE_HIDDEN_FIELD, SUB_ACTION_NAME);             
CREATE CACHED TABLE PUBLIC.PLUGIN_DIALOGS(
    PANEL_TYPE CHAR(50) NOT NULL,
    PANEL_NAME CHAR(50) NOT NULL,
    PANEL_CLASS CHAR(100),
    PANEL_WIDTH CHAR(3),
    PANEL_HEIGHT CHAR(3),
    PANEL_X CHAR(4),
    PANEL_Y CHAR(4),
    PANEL_DESC CHAR(100)
);             
-- 3 = SELECT COUNT(*) FROM PUBLIC.PLUGIN_DIALOGS;             
INSERT INTO PUBLIC.PLUGIN_DIALOGS(PANEL_TYPE, PANEL_NAME, PANEL_CLASS, PANEL_WIDTH, PANEL_HEIGHT, PANEL_X, PANEL_Y, PANEL_DESC) VALUES
('floatingPanel', 'generalEditorPanel4', 'org.bungeni.editor.panels.generalEditorPanel4', '225', '580', ' u', ' u', 'Toolbar Panel'),
('floatingPanel', 'toolbarUIPanel', 'org.bungeni.editor.panels.holderUIPanel', '225', '657', 'u', 'u', 'Action Panel'),
('floatingPanel', 'floatingSectionMetadataPanel', 'org.bungeni.editor.panels.floatingSectionMetadataPanel', '185', '202', 'u', 'u', 'Section Metadata');  
CREATE PRIMARY KEY ON PUBLIC.PLUGIN_DIALOGS(PANEL_TYPE, PANEL_NAME);           
CREATE CACHED TABLE PUBLIC.TOOLBAR_XML_CONFIG(
    DOC_TYPE VARCHAR(100) NOT NULL,
    TOOLBAR_XML VARCHAR(100) NOT NULL
);    
-- 3 = SELECT COUNT(*) FROM PUBLIC.TOOLBAR_XML_CONFIG;         
INSERT INTO PUBLIC.TOOLBAR_XML_CONFIG(DOC_TYPE, TOOLBAR_XML) VALUES
('bill', 'settings/toolbar_bill.xml'),
('debaterecord', 'settings/toolbar_debate_b.xml'),
('judgement', 'settings/toolbar_judgement.xml'); 
CREATE PRIMARY KEY ON PUBLIC.TOOLBAR_XML_CONFIG(DOC_TYPE);     
CREATE CACHED TABLE PUBLIC.EDITOR_PANELS(
    DOCTYPE VARCHAR(100) NOT NULL,
    PANEL_TYPE VARCHAR(50) NOT NULL,
    PANEL_CLASS VARCHAR(100) NOT NULL,
    PANEL_LOAD_ORDER CHAR(2) NOT NULL,
    PANEL_TITLE VARCHAR(100) NOT NULL,
    PANEL_DESC VARCHAR(100),
    STATE INT
);           
-- 13 = SELECT COUNT(*) FROM PUBLIC.EDITOR_PANELS;             
INSERT INTO PUBLIC.EDITOR_PANELS(DOCTYPE, PANEL_TYPE, PANEL_CLASS, PANEL_LOAD_ORDER, PANEL_TITLE, PANEL_DESC, STATE) VALUES
('bill', 'tabbed', 'org.bungeni.editor.panels.loadable.sectionTreeMetadataPanel', '3', 'Section Metadata', 'Bill Section Metadata', 1),
('bill', 'tabbed', 'org.bungeni.editor.panels.loadable.transformXMLPanel', '4', 'Transform', 'Transform', 1),
('bill', 'tabbed', 'org.bungeni.editor.panels.loadable.sectionNumbererPanel', '5', 'Bill Numbering', 'Bill Numbering', 1),
('debaterecord', 'tabbed', 'org.bungeni.editor.panels.loadable.documentNotesPanel', '1', 'Document Notes', 'Document notes and document switcher', 1),
('debaterecord', 'tabbed', 'org.bungeni.editor.panels.loadable.documentMetadataPanel', '2', 'Document Metadata', 'Document metadata', 1),
('debaterecord', 'tabbed', 'org.bungeni.editor.panels.loadable.sectionTreeMetadataPanel', '3', 'Section Metadata', 'Section metadata', 1),
('bill', 'tabbed', 'org.bungeni.editor.panels.loadable.documentNotesPanel', '1', 'Notes', 'Document notes and document ', 1),
('bill', 'tabbed', 'org.bungeni.editor.panels.loadable.documentMetadataPanel', '2', 'Metadata', 'Bill Metadata', 1),
('debaterecord', 'tabbed', 'org.bungeni.editor.panels.loadable.transformXMLPanel', '4', 'Transform Debate', 'Transform Debate', 1),
('judgement', 'tabbed', 'org.bungeni.editor.panels.loadable.documentMetadataPanel', '2', 'Document Metadata', 'Document metadata', 1),
('judgement', 'tabbed', 'org.bungeni.editor.panels.loadable.documentNotesPanel', '1', 'Document Notes', 'Document notes and document switcher', 1),
('judgement', 'tabbed', 'org.bungeni.editor.panels.loadable.sectionTreeMetadataPanel', '3', 'Section Metadata', 'Section metadata', 1),
('judgement', 'tabbed', 'org.bungeni.editor.panels.loadable.transformXMLPanel', '4', 'Transform Debate', 'Transform Debate', 1);            
CREATE PRIMARY KEY ON PUBLIC.EDITOR_PANELS(DOCTYPE, PANEL_TYPE, PANEL_CLASS);  
CREATE CACHED TABLE PUBLIC.NUMBER_DECORATORS(
    DECORATOR_NAME CHAR(25) NOT NULL,
    DECORATOR_DESC CHAR(50) NOT NULL,
    DECORATOR_CLASS CHAR(100) NOT NULL
);            
-- 6 = SELECT COUNT(*) FROM PUBLIC.NUMBER_DECORATORS;          
INSERT INTO PUBLIC.NUMBER_DECORATORS(DECORATOR_NAME, DECORATOR_DESC, DECORATOR_CLASS) VALUES
('flowerBracket', 'Flower Bracket ( {1}, {2}...)', 'org.bungeni.numbering.decorators.flowerBracketDecorator'),
('hashPrefix', 'Hash Prefix (#1, #2, ...)', 'org.bungeni.numbering.decorators.hashPrefixDecorator'),
('postDashed', 'Dash Suffix (1 - , 2 - , 3 - ..)', 'org.bungeni.numbering.decorators.postDashedDecorator'),
('postDotted', 'Dot Suffix (1. , 2., 3. ...)', 'org.bungeni.numbering.decorators.postDottedDecorator'),
('parens', 'Parens ( (1), (2), (3)....)', 'org.bungeni.numbering.decorators.parensDecorator'),
('square', 'Square ( [1],[2],[3]... )', 'org.bungeni.numbering.decorators.squareDecorator');               
CREATE PRIMARY KEY ON PUBLIC.NUMBER_DECORATORS(DECORATOR_NAME);
CREATE CACHED TABLE PUBLIC.DOCUMENT_SECTION_TYPES(
    DOC_TYPE VARCHAR(100) NOT NULL,
    SECTION_TYPE_NAME VARCHAR(50) NOT NULL,
    SECTION_NAME_PREFIX VARCHAR(100),
    SECTION_NUMBERING_STYLE CHAR(10),
    SECTION_BACKGROUND CHAR(15),
    SECTION_INDENT_LEFT CHAR(10),
    SECTION_INDENT_RIGHT CHAR(10),
    SECTION_VISIBILITY CHAR(10),
    NUMBERING_SCHEME CHAR(30),
    NUMBER_DECORATOR CHAR(20)
);          
-- 39 = SELECT COUNT(*) FROM PUBLIC.DOCUMENT_SECTION_TYPES;    
INSERT INTO PUBLIC.DOCUMENT_SECTION_TYPES(DOC_TYPE, SECTION_TYPE_NAME, SECTION_NAME_PREFIX, SECTION_NUMBERING_STYLE, SECTION_BACKGROUND, SECTION_INDENT_LEFT, SECTION_INDENT_RIGHT, SECTION_VISIBILITY, NUMBERING_SCHEME, NUMBER_DECORATOR) VALUES
('debaterecord', 'body', 'debaterecord', 'single', '0xffffff', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'MastHead', 'preface', STRINGDECODE('\u00a0'), '0x00ffff', '.3', '0', 'user', 'none', 'none'),
('debaterecord', 'SystemMemberMetadata', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'NoticeOfMotion', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'NoticeOfMotionDetails', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'MetadataContainer', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'Speech', 'speech', 'serial', '0x00ffff', '.6', '0', 'user', 'none', 'none'),
('debaterecord', 'None', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'RootSection', '', '', '', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'SystemDateTimeMetadata', '', '', '', '0', '0', 'user', 'none', 'none'),
('bill', 'Article', 'article', 'serial', '0xf0f0f0', '.3', '0', 'user', 'NUMERIC', 'flowerBracket'),
('bill', 'Clause', 'clause', 'serial', '0xffdfdf', '.5', '0', 'user', 'ROMAN', 'hashPrefix'),
('bill', 'MastHead', 'preface', 'single', '0xe8eef7', '0', '0', 'user', 'none', 'postDashed'),
('bill', 'NumberedContainer', 'num_', 'single', '0xffffe1', '0', '0', 'system', 'none', 'postDotted'),
('bill', 'Part', 'part', 'serial', '0xffffa1', '.3', '0', 'user', 'ALPHABETICAL', 'postDashed'),
('bill', 'Section', 'section', 'serial', '0xffaa00', '.6', '0', 'user', 'ALPHABETICAL-Lower', 'parens'),
('bill', 'SubSection', 'subsection', 'serial', '0x00ffff', '.8', '0', 'user', 'ROMAN-Upper', 'square'),
('bill', 'Chapter', 'chapter', 'serial', '0xe8ee88', '.4', '0', 'user', 'ROMAN-Upper', 'none'),
('bill', 'SubChapter', 'subchapter', 'serial', '0xffaa00', '.5', '0', 'user', 'ROMAN-Upper', 'postDotted'),
('bill', 'Paragraph', 'para', 'serial', '0xffff00', '.7', '0', 'user', 'ALPHABETICAL-Lower', 'parens'),
('bill', 'SubParagraph', 'subpara', 'serial', '0xffff00', '.8', '0', 'user', 'ROMAN-Lower', 'parens'),
('debaterecord', 'QuestionsContainer', 'questions', 'serial', '0xffff00', '.3', '0', 'user', 'none', 'none'),
('debaterecord', 'QuestionAnswer', 'qa', 'serial', '0x00ffff', '.4', '0', 'user', 'none', 'none'),
('debaterecord', 'Question', 'sque', 'serial', '0xffdfdf', '.5', '0', 'user', 'none', 'none'),
('debaterecord', 'GroupActivity', 'comment', 'serial', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'Observation', 'comment', 'serial', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'Communication', 'comnctn', 'serial', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'ActionEvent', 'actionevt', 'serial', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'Conclusion', 'concl', 'serial', '0xffff00', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'MotionsContainer', 'allmotions', 'serial', '0xf0f0f0', '.3', '0', 'user', 'none', 'none'),
('debaterecord', 'Motion', 'motion', 'serial', '0xaa0000', '.5', '0', 'user', 'none', 'none'),
('debaterecord', 'TabledDocuments', 'papers', 'serial', '0x0ff000', '0', '0', 'user', 'none', 'none'),
('debaterecord', 'TabledDocumentsList', 'tbldocs', 'serial', '0x044000', '.3', '0', 'user', 'none', 'none'),
('judgement', 'Header', 'header', 'single', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('judgement', 'Introduction', 'intro', 'single', '0x044000', '0', '0', 'user', 'none', 'none'),
('judgement', 'Background', 'bg', 'single', '0x0ff000', '0', '0', 'user', 'none', 'none'),
('judgement', 'Motivation', 'motive', 'single', '0xf0f0f0', '0', '0', 'user', 'none', 'none'),
('judgement', 'Decision', 'decision', 'single', '0x00ffff', '0', '0', 'user', 'none', 'none'),
('judgement', 'Conclusion', 'concl', 'serial', '0xffff00', '0', '0', 'user', 'none', 'none');    
CREATE PRIMARY KEY ON PUBLIC.DOCUMENT_SECTION_TYPES(DOC_TYPE, SECTION_TYPE_NAME);              
CREATE CACHED TABLE PUBLIC.REFERENCE_SYNTAX(
    SYNTAX_NAME CHAR(20) NOT NULL,
    SYNTAX_TYPE CHAR(20) NOT NULL,
    SYNTAX CHAR(300) NOT NULL
);            
-- 1 = SELECT COUNT(*) FROM PUBLIC.REFERENCE_SYNTAX;           
INSERT INTO PUBLIC.REFERENCE_SYNTAX(SYNTAX_NAME, SYNTAX_TYPE, SYNTAX) VALUES
('bill_internal_ref', 'internal', '<artPrefix><artType><artSuffix><refPrefix><refPlaceHolder><refSuffix>');       
CREATE CACHED TABLE PUBLIC.TRANSFORM_CONFIGURATIONS(
    DOC_TYPE VARCHAR(100) NOT NULL,
    CONFIG_NAME VARCHAR(100) NOT NULL,
    CONFIG_FILE VARCHAR(500) NOT NULL
);       
-- 2 = SELECT COUNT(*) FROM PUBLIC.TRANSFORM_CONFIGURATIONS;   
INSERT INTO PUBLIC.TRANSFORM_CONFIGURATIONS(DOC_TYPE, CONFIG_NAME, CONFIG_FILE) VALUES
('bill', 'billCommon', 'odttoakn/minixslt/bill/pipeline.xsl'),
('debaterecord', 'debateRecordCommon', 'odttoakn/minixslt/debaterecord/pipeline.xsl');   
CREATE PRIMARY KEY ON PUBLIC.TRANSFORM_CONFIGURATIONS(DOC_TYPE, CONFIG_NAME);  
CREATE CACHED TABLE PUBLIC.RESOURCE_MESSAGE_BUNDLES(
    BUNDLE_NAME CHAR(100) NOT NULL,
    DOC_TYPE CHAR(100) NOT NULL
);    
-- 6 = SELECT COUNT(*) FROM PUBLIC.RESOURCE_MESSAGE_BUNDLES;   
INSERT INTO PUBLIC.RESOURCE_MESSAGE_BUNDLES(BUNDLE_NAME, DOC_TYPE) VALUES
('DocMetaNames', 'bill'),
('SectionMetaNames', 'bill'),
('SectionTypeNames', 'bill'),
('SectionTypeNames', 'debaterecord'),
('SectionMetaNames', 'debaterecord'),
('DocMetaNames', 'debaterecord');  
CREATE PRIMARY KEY ON PUBLIC.RESOURCE_MESSAGE_BUNDLES(DOC_TYPE, BUNDLE_NAME);  
CREATE CACHED TABLE PUBLIC.GENERAL_EDITOR_PROPERTIES(
    PROPERTY_NAME CHAR(50) NOT NULL,
    PROPERTY_VALUE CHAR(500),
    PROPERTY_DESCRIPTION VARCHAR(100)
);              
-- 31 = SELECT COUNT(*) FROM PUBLIC.GENERAL_EDITOR_PROPERTIES; 
INSERT INTO PUBLIC.GENERAL_EDITOR_PROPERTIES(PROPERTY_NAME, PROPERTY_VALUE, PROPERTY_DESCRIPTION) VALUES
('defaultWorkURI', 'CountryCode.FullDate.PartName', ''),
('defaultHierarchyView', 'VIEW_PRETTY_SECTIONS', 'Other options are VIEW_SECTIONS, VIEW_PARAGRAPHS'),
('registryJDBCdriver', 'org.h2.Driver', 'jdbc driver to use for registry'),
('registryDB', 'registry.db', 'registry db name'),
('registryJDBCdriverPrefix', 'jdbc:h2:', 'prefix for registry jdbc connection string'),
('logoPath', 'settings/logos', 'path to logo'),
('activeDocumentMode', 'judgement', 'editor client is set to edit a document of this type'),
('root:debaterecord', 'debaterecord', 'name of root sectionfor debaterecord'),
('localRegistry', 'yes', 'registry is a local database '),
('registryUser', 'sa', 'user name to connect to registry db'),
('registryPassword', '', 'password to connect to registry db'),
('localRegistryFolder', 'registry', 'path to local registry (sub folder under main installation)'),
('textMetadataPropertyBeginMarker', '{{', 'used to demarcate beginning of inline metadata'),
('textMetadataPropertyEndMarker', '}}', 'used to demarcate ending of inline metadata '),
('toolbarXmlConfig', 'settings/toolbar.xml', 'used to load editor toolbar'),
('iconPath', '/gui', 'path to icons used by editor'),
('defaultExportPath', 'workspace/export', 'default export path'),
('root:bill', 'bill', STRINGDECODE('\u00a0')),
('pathToLogFile', 'logs/log.txt', 'Path to Log file'),
('truncateLogOnStartup', 'true', 'Truncates log file on startup'),
('langISO', 'eng', 'iso language mode for editor'),
('countryISO', 'ken', 'iso country code'),
('metadataDateFormat', 'yyyy-MM-dd', 'metadata date format'),
('metadataTimeFormat', 'HH:mm', 'metadata time format'),
('popupDialogBackColor', '#C5DD45', 'popup dialog background color'),
('locale.Language', 'en', 'language code used for java locales'),
('locale.Country', 'US', 'country code use for java locales'),
('messageBundlesPath', 'settings/bundles', 'message bundles path'),
('defaultSavePath', 'workspace/files', 'default file save path'),
('defaultSaveFormat', 'CountryCode.DocumentType.Year.Month.Day.LanguageCode.PartName.FileName', 'default save format'),
('root:judgement', 'judgement', 'name of root section for judgement'); 
CREATE PRIMARY KEY ON PUBLIC.GENERAL_EDITOR_PROPERTIES(PROPERTY_NAME);         
CREATE CACHED TABLE PUBLIC.TRANSFORM_TARGETS(
    TARGET_NAME CHAR(100) NOT NULL,
    TARGET_DESC CHAR(100) NOT NULL,
    TARGET_EXT CHAR(100) NOT NULL,
    TARGET_CLASS CHAR(100) NOT NULL
);
-- 4 = SELECT COUNT(*) FROM PUBLIC.TRANSFORM_TARGETS;          
INSERT INTO PUBLIC.TRANSFORM_TARGETS(TARGET_NAME, TARGET_DESC, TARGET_EXT, TARGET_CLASS) VALUES
('ODT', 'OpenDocument File', 'odt', 'org.bungeni.ooo.transforms.loadable.ODTSaveTransform'),
('HTML', 'HTML File', 'html', 'org.bungeni.ooo.transforms.loadable.HTMLTransform'),
('AN-XML', 'AkomaNtoso XML File', 'xml', 'org.bungeni.ooo.transforms.loadable.AnXmlTransform'),
('PDF', 'PDF file', 'pdf', 'org.bungeni.ooo.transforms.loadable.PDFTransform');               
CREATE CACHED TABLE PUBLIC.DOCUMENT_TYPES(
    DOC_TYPE VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100),
    TEMPLATE_PATH VARCHAR(250),
    METADATA_MODEL_EDITOR CHAR(100),
    METADATA_EDITOR_TITLE CHAR(50),
    WORK_URI CHAR(150),
    EXP_URI CHAR(150),
    FILE_NAME_SCHEME CHAR(150)
);         
-- 6 = SELECT COUNT(*) FROM PUBLIC.DOCUMENT_TYPES;             
INSERT INTO PUBLIC.DOCUMENT_TYPES(DOC_TYPE, DESCRIPTION, TEMPLATE_PATH, METADATA_MODEL_EDITOR, METADATA_EDITOR_TITLE, WORK_URI, EXP_URI, FILE_NAME_SCHEME) VALUES
('judgement', 'Judgement', 'workspace/templates/judgement.ott', 'org.bungeni.editor.metadata.editors.JudgementMetadata', 'Judgement Metadata', '~CountryCode~DocumentType~Year-Month-Day', '~CountryCode~DocumentType~Year-Month-Day~LanguageCode', 'CountryCode~DocumentType~Year-Month-Day~LanguageCode'),
('act', 'Act', 'workspace/templates/act.ott', '', NULL, NULL, NULL, NULL),
('report', 'Report', 'workspace/templates/report.ott', '', NULL, NULL, NULL, NULL),
('document', 'Document', 'workspace/templates/defaultdoc.ott', 'org.bungeni.editor.metadata.editors.GeneralMetadata', 'General Metadata', '~CountryCode~DocumentType~Year-Month-Day', '~CountryCode~DocumentType~Year-Month-Day~LanguageCode', 'CountryCode~DocumentType~Year-Month-Day~LanguageCode'),
('bill', 'Bill', 'workspace/templates/bill.ott', 'org.bungeni.editor.metadata.editors.BillMetadata', 'Bill Metadata', STRINGDECODE('\t~CountryCode~DocumentType~Year-Month-Day'), '~CountryCode~DocumentType~Year-Month-Day~LanguageCode', 'CountryCode~DocumentType~Year-Month-Day~LanguageCode'),
('debaterecord', 'Debate Record', 'workspace/templates/hansard.ott', 'org.bungeni.editor.metadata.editors.GeneralMetadata', 'DebateRecord Metadata', '~CountryCode~DocumentType~Year-Month-Day', '~CountryCode~DocumentType~Year-Month-Day~LanguageCode', 'CountryCode~DocumentType~Year-Month-Day~LanguageCode');   
CREATE PRIMARY KEY ON PUBLIC.DOCUMENT_TYPES(DOC_TYPE);         
ALTER TABLE PUBLIC.REFERENCE_SYNTAX ADD CONSTRAINT PUBLIC.CONSTRAINT_8 PRIMARY KEY(SYNTAX_NAME);               
ALTER TABLE PUBLIC.TRANSFORM_TARGETS ADD CONSTRAINT PUBLIC.CONSTRAINT_F PRIMARY KEY(TARGET_NAME);              
ALTER TABLE PUBLIC.ACTION_SETTINGS ADD CONSTRAINT PUBLIC.CONSTRAINT_0 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;
ALTER TABLE PUBLIC.DOCUMENT_SECTION_TYPES ADD CONSTRAINT PUBLIC.CONSTRAINT_2 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;         
ALTER TABLE PUBLIC.ACTION_PARENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;  
ALTER TABLE PUBLIC.SUB_ACTION_SETTINGS ADD CONSTRAINT PUBLIC.CONSTRAINT_10 FOREIGN KEY(DOC_TYPE, PARENT_ACTION_NAME) REFERENCES PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME) NOCHECK;         
ALTER TABLE PUBLIC.ACTION_PARENT ADD CONSTRAINT PUBLIC.CONSTRAINT_4 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;  
ALTER TABLE PUBLIC.TOOLBAR_MENU_GROUPS ADD CONSTRAINT PUBLIC.CONSTRAINT_11 FOREIGN KEY(DISPLAY_STRING_KEY) REFERENCES PUBLIC.LOCALIZED_DISPLAY_STRINGS(STRING_KEY) NOCHECK;    
ALTER TABLE PUBLIC.TOOLBAR_XML_CONFIG ADD CONSTRAINT PUBLIC.CONSTRAINT_5 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;             
ALTER TABLE PUBLIC.ACTION_PARENT ADD CONSTRAINT PUBLIC.CONSTRAINT_7 FOREIGN KEY(DOC_TYPE, ACTION_NAME) REFERENCES PUBLIC.ACTION_SETTINGS(DOC_TYPE, ACTION_NAME) NOCHECK;       
ALTER TABLE PUBLIC.DOCUMENT_METADATA ADD CONSTRAINT PUBLIC.CONSTRAINT_9 FOREIGN KEY(DOC_TYPE) REFERENCES PUBLIC.DOCUMENT_TYPES(DOC_TYPE) NOCHECK;              
