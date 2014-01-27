
CODEDIR=plasmoid-animatedimage/contents/code

${CODEDIR}/config_ui.rb: ui/config.ui
	rbuic4 $^ -o $@

clean:
	rm ${CODEDIR}/config_ui.rb

