all: Formula/xt.rb

Formula/%.rb: Template/%.erb libtemplate.rb
	erb -T - -r ./libtemplate.rb $< > $@
