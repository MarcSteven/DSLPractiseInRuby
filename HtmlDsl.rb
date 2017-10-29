
#just use to practise using DSL In ruby
# created by Marc Steven 2017-10-29
# @copyright Marc Steven ..............



class HtmlDsl
  attr_reader:result
  def initialize(&block)
    instance_eval(&block)
  end

  private
  def method_missing(name,*args,&block)
    tag = name.to_s
    content = args.first
    @result || = ''
    @result << "<#{tag}>"
    if block_given?
      instance_eval(&block)
    else
      @result << content
    end
    @result << "</#{tag}"
  end
end
html = HtmlDsl.new do
  html do
    head do
      title 'yoyo'
    end
    body do
      h1 'hey'
    end
  end
end
p html.result
#+> "<html><head><title>yoyo</title></head><body><h1>hey</h1></body></html>"
