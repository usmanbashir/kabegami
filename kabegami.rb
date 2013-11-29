require "java"

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JOptionPane
import java.lang.System
import java.awt.SystemTray
import java.awt.Toolkit
import java.awt.TrayIcon
import java.awt.PopupMenu
import java.awt.MenuItem

APP_NAME = "Kabegami"
APP_ICON = "icon.png"

class Kabegami < JFrame

  def initialize
    super APP_NAME
    
    self.initTray
    self.initUI
  end

  def initTray
    if SystemTray.isSupported
      tray          = SystemTray.getSystemTray
      icon          = Toolkit.getDefaultToolkit.getImage APP_ICON

      popupMenu     = PopupMenu.new

      menuItemExit  = MenuItem.new "Exit"
      menuItemExit.addActionListener do |e|
        confirm = JOptionPane.showConfirmDialog(
                    nil, 
                    "Are you sure dude, you wanna call it a day?",
                    "Just Checking?",
                    JOptionPane::YES_NO_OPTION
                  )

        System.exit 0 if confirm == JOptionPane::YES_OPTION
      end

      popupMenu.add menuItemExit
      
      trayIcon      = TrayIcon.new icon, APP_NAME, popupMenu

      tray.add trayIcon
    end
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