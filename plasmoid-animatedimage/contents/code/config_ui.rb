=begin
** Form generated from reading ui file 'config.ui'
**
** Created: Mon Jan 27 14:57:19 2014
**      by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Config
    attr_reader :verticalLayout
    attr_reader :m_selectFileButton
    attr_reader :m_filePath

    def setupUi(config)
    if config.objectName.nil?
        config.objectName = "config"
    end
    config.resize(312, 176)
    @verticalLayout = Qt::VBoxLayout.new(config)
    @verticalLayout.objectName = "verticalLayout"
    @m_selectFileButton = Qt::PushButton.new(config)
    @m_selectFileButton.objectName = "m_selectFileButton"

    @verticalLayout.addWidget(@m_selectFileButton)

    @m_filePath = Qt::Label.new(config)
    @m_filePath.objectName = "m_filePath"

    @verticalLayout.addWidget(@m_filePath)


    retranslateUi(config)

    Qt::MetaObject.connectSlotsByName(config)
    end # setupUi

    def setup_ui(config)
        setupUi(config)
    end

    def retranslateUi(config)
    config.windowTitle = Qt::Application.translate("Config", "Form", nil, Qt::Application::UnicodeUTF8)
    @m_selectFileButton.text = Qt::Application.translate("Config", "Select File", nil, Qt::Application::UnicodeUTF8)
    @m_filePath.text = Qt::Application.translate("Config", "FilePath", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(config)
        retranslateUi(config)
    end

end

module Ui
    class Config < Ui_Config
    end
end  # module Ui

