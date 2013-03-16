require 'helper'

class TestDocxtorGenerator < Test::Unit::TestCase
  context "Generating from html" do
    setup do
      @docxtor = Docxtor::Generator.new

      @template = File.read(File.join(File.dirname(__FILE__), 'support', 'template.html'))
      @path = "./test.docx"
    end

    should "respond to #from_html" do
      assert_respond_to @docxtor, :from_html
    end

    context "#from_html" do
      should "accept template and path arguments" do
        @docxtor.expects(:save).returns(true)
        assert_block do
          @docxtor.from_html @template, @path
        end
      end
    end

    context "#generate" do
      should "generate .docx file from html" do
        parser = Docxtor::Parser::HTML.new
        # TODO parser output is wrong!
        parser_output = {:document => "Hello, docxtor!"}
        parser.expects(:parse).with(@template).returns(parser_output)

        builder = Docxtor::Builder.new
        builder_output = {"[Content_Types].xml" => "Some file"}
        builder.expects(:build).with(parser_output).returns(builder_output)

        @docxtor.expects(:save).returns(true)
        @docxtor.template = @template
        @docxtor.path = @path

        assert @docxtor.generate :from => :html, :parser => parser, :builder => builder
      end
    end
  end
end
