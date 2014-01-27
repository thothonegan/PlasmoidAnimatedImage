require 'plasma_applet'

require 'config_ui'

module PlasmoidAnimatedimage
	class Main < PlasmaScripting::Applet

		slots 'selectFile()'

		def initialize(parent)
			super parent
		end

		def init
			self.has_configuration_interface = true 
			self.aspect_ratio_mode = Plasma::IgnoreAspectRatio
			self.background_hints = Plasma::Applet.NoBackground

			@m_configWidget = Ui::Config.new

			@m_label = Plasma::Label.new self

			@m_movie = Qt::Movie.new self

			@m_movie.setCacheMode Qt::Movie::CacheAll

			qlabel = @m_label.nativeWidget
			qlabel.setMovie (@m_movie)
		#	qlabel.setScaledContents true

			layout = Qt::GraphicsLinearLayout.new Qt::Horizontal, self
			layout.add_item @m_label
			self.layout = layout

			config = self.config
			fileName = config.readEntry "fileName", nil

			if fileName != nil
				self.setFileName fileName
			end

			#@m_movie.start
		end

		def handleResize (rect)
		#	qDebug "Scaling to #{rect.size.width} #{rect.size.height}"
		#	@m_movie.setScaledSize (rect.size)
		end


		def paintInterface (painter, option, rect)

			if @m_lastContentsRect != rect
				self.handleResize(rect)
				@m_lastContentsRect = rect
			end
		end

		def createConfigurationInterface (parent)
			# see http://community.kde.org/User:Mxttie#Adding_configuration

			widget = Qt::Widget.new 
			@m_configWidget.setup_ui widget

			@m_configWidget.m_filePath.setText @m_movie.fileName

			Qt::Object.connect @m_configWidget.m_selectFileButton, SIGNAL('clicked()'), self, SLOT('selectFile()')

			parent.addPage widget, "General", self.icon
		end

		def setFileName (fileName)
			@m_movie.stop
			@m_movie.setFileName fileName
			@m_movie.start
		end

		def selectFile ()
			filePath = Qt::FileDialog::getOpenFileName nil, "Select Animated Image", nil, "Images (*.gif)"

			if (filePath != nil)
				setFileName (filePath)

				config = self.config;
				config.writeEntry "fileName", filePath
				emit configNeedsSaving()
			end

		end

		@m_label = nil
		@m_movie = nil

		@m_configWidget = nil
		@m_lastContentsRect = nil
	end
end

