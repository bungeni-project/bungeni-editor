package test;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import ag.ion.bion.officelayer.NativeView;
import ag.ion.bion.officelayer.application.IApplicationAssistant;
import ag.ion.bion.officelayer.application.ILazyApplicationInfo;
import ag.ion.bion.officelayer.application.IOfficeApplication;
import ag.ion.bion.officelayer.application.OfficeApplicationException;
import ag.ion.bion.officelayer.application.OfficeApplicationRuntime;
import ag.ion.bion.officelayer.desktop.IFrame;
import ag.ion.bion.officelayer.document.DocumentDescriptor;
import ag.ion.bion.officelayer.document.IDocument;
import ag.ion.bion.officelayer.internal.application.ApplicationAssistant;
import ag.ion.bion.officelayer.text.ITextCursor;
import ag.ion.bion.officelayer.text.ITextDocument;
import ag.ion.bion.officelayer.text.TextException;

public class SwingControl extends JFrame
implements ActionListener {

	private IOfficeApplication officeApplication = null;
	private IFrame             officeFrame       = null;
	private ITextDocument      document          = null;
	private JPanel             noaPanel          = null;
	private JButton            button            = null;

	public SwingControl() {
		super(SwingControl.class.getName());
		getContentPane().setLayout(new GridLayout());
		noaPanel = new JPanel();
		getContentPane().add(noaPanel);
		setSize(500, 500);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		fillNOAPanel();
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent windowEvent) {
				try {
					if (document != null)
						document.close();
					document = null;
					if (officeApplication != null) {
						officeApplication.deactivate();
						officeApplication.dispose();
						officeApplication = null;
					}
				}
				catch (OfficeApplicationException applicationException) {
					//do not consume
				}
			}
		});
	}

	private void fillNOAPanel() {
		if (noaPanel != null) {
			try {
				if (officeApplication == null)
					officeApplication = startOOO();
				officeFrame = constructOOOFrame(officeApplication, noaPanel);
				document = (ITextDocument) officeApplication.getDocumentService().constructNewDocument(officeFrame,
						IDocument.WRITER,
						DocumentDescriptor.DEFAULT);

				noaPanel.setVisible(true);
			}
			catch (Throwable throwable) {
				noaPanel.add(new JLabel("An error occured while creating the NOA panel: " + throwable.getMessage()));
			}
		}
	}

	private IOfficeApplication startOOO() throws Throwable {
		IApplicationAssistant applicationAssistant = new ApplicationAssistant(System.getProperty("user.dir") + "\\lib");
		ILazyApplicationInfo[] appInfos = applicationAssistant.getLocalApplications();
		if (appInfos.length < 1)
			throw new Throwable("No OpenOffice.org Application found.");
		HashMap configuration = new HashMap();
		configuration.put(IOfficeApplication.APPLICATION_HOME_KEY, appInfos[0].getHome());
		configuration.put(IOfficeApplication.APPLICATION_TYPE_KEY, IOfficeApplication.LOCAL_APPLICATION);
		IOfficeApplication officeAplication = OfficeApplicationRuntime.getApplication(configuration);

		officeAplication.setConfiguration(configuration);
		officeAplication.activate();
		return officeAplication;
	}

	private IFrame constructOOOFrame(IOfficeApplication officeApplication, final Container parent)
	throws Throwable {
		final NativeView nativeView = new NativeView(System.getProperty("user.dir") + "\\lib");
		parent.add(nativeView);
		button = new JButton("Press"); button.addActionListener(this);
		parent.add(button);
		parent.addComponentListener(new ComponentAdapter() {
			public void componentResized(ComponentEvent e) {
				nativeView.setPreferredSize(new Dimension(parent.getWidth() - 100, parent.getHeight() - 5));
				parent.getLayout().layoutContainer(parent);
			}
		});
		nativeView.setPreferredSize(new Dimension(parent.getWidth() - 100, parent.getHeight() - 5));
		parent.getLayout().layoutContainer(parent);
		IFrame officeFrame = officeApplication.getDesktopService().constructNewOfficeFrame(nativeView);
		parent.validate();
		return officeFrame;
	}
	
	
	
	/**
	 * Now we will write a text to the document. After that is done (we already
	 * shoud now how to write text down to the document) we will use a new 
	 * method to append more text content.
	 * 
	 * @param textDocument the document to place the table in
	 *
	 * @author Sebastian R�sgen
	 * @date 17.03.2006
	 */
	public static void placeSomeTextContent(ITextDocument textDocument) {
	  	
	  	textDocument.getTextService().getText().setText("The Raven (excerpt)\n\n");		
	  	
	  	String[] text2BePlaced = { 
	  		// since there is no better poem than Edgar Allan Poe's the Raven
	  		// we will use some staves from it
				"Once upon a midnight dreary, while I pondered weak and weary,",
				"Over many a quaint and curious volume of forgotten lore,",
				"While I nodded, nearly napping, suddenly there came a tapping,",
				"As of some one gently rapping, rapping at my chamber door.",
				"`'Tis some visitor,' I muttered, `tapping at my chamber door -",
				"Only this, and nothing more.'",
				"",
				"...",
				"",
				"Then this ebony bird beguiling my sad fancy into smiling,",
				"By the grave and stern decorum of the countenance it wore,",
				"`Though thy crest be shorn and shaven, thou,' I said, `art sure no craven.",
				"Ghastly grim and ancient raven wandering from the nightly shore -",
				"Tell me what thy lordly name is on the Night's Plutonian shore!'",
				"Quoth the raven, `Nevermore.'",
				"",
				"Much I marvelled this ungainly fowl to hear discourse so plainly,",
				"Though its answer little meaning - little relevancy bore;",
				"For we cannot help agreeing that no living human being",
				"Ever yet was blessed with seeing bird above his chamber door -",
				"Bird or beast above the sculptured bust above his chamber door,",
				"With such name as `Nevermore.'",
				"",
				"...",
				"",
				"But the raven, sitting lonely on the placid bust, spoke only,",
				"That one word, as if his soul in that one word he did outpour.",
				"Nothing further then he uttered - not a feather then he fluttered -",
				"Till I scarcely more than muttered `Other friends have flown before -",
				"On the morrow will he leave me, as my hopes have flown before.'",
				"Then the bird said, `Nevermore.'",
				"",
				"Startled at the stillness broken by reply so aptly spoken,",
				"`Doubtless,' said I, `what it utters is its only stock and store,",
				"Caught from some unhappy master whom unmerciful disaster",
				"Followed fast and followed faster till his songs one burden bore -",
				"Till the dirges of his hope that melancholy burden bore",
				"Of \"Never-nevermore.\"'"
	  	};
	  	
	  	try {
		  	ITextCursor textCursor = 
		  		textDocument.getTextService().getText().getTextCursorService().getTextCursor();
		  	
		  	textCursor.gotoEnd(false);
		  	
		  	for(int i=0;i<text2BePlaced.length;i++ ) {
		  		textCursor.getEnd().setText(text2BePlaced[i]); //we place the text
		  		textCursor.getEnd().setText("\n"); // and we wrap the line
		  	}
		  }
	  	catch(TextException exception) {
	  		exception.printStackTrace();
	  	}


		}

	public static void main(String[] argv) {
		new SwingControl();
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		placeSomeTextContent(document);
	}
}