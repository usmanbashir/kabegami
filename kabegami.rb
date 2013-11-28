require "java"

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JOptionPane
import java.lang.System

APP_NAME = "Kabegami"

class Kabegami < JFrame

  def initialize
    super APP_NAME
    self.initUI
  end
  
  def initUI
    # Setup the Main window.
    
    self.setSize 300, 200
    
    self.setDefaultCloseOperation JFrame::DISPOSE_ON_CLOSE
    
    # Center the window on the screen
    self.setLocationRelativeTo nil
    
    
    # Setup basic UI elements.
    
    panel = JPanel.new
    self.getContentPane.add panel
    panel.setLayout nil
    
    btnClose = JButton.new "Close"
    btnClose.setBounds 170, 120, 100, 30
    btnClose.setToolTipText "Click to close this window."
    btnClose.addActionListener { dispose() }
    
    panel.add btnClose
    
    # Everthing is setup, we can render the window now.
    self.setVisible true
  end

end

Kabegami.new