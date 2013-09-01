ENV.delete 'HTTP_PROXY' if ENV['HTTP_PROXY']
require 'rubygems' #for ruby187
require 'erb'
require 'psych'
root_path = File.expand_path("..", File.dirname(__FILE__))
Dir[File.join(root_path,"lib/**/*.rb")].each {|f| require f}
Dir[File.join(root_path,"defered_lib/**/*.rb")].each {|f| require f}
Dir[File.join(root_path,"cases/shared/**/*.rb")].each {|f| require f}
Dir[File.join(root_path,"matchers/**/*.rb")].each {|f| require f}

begin
	require 'lazyman'
rescue LoadError
	puts 'you need using "gem install lazyman" to install lazyman first'
end

def turn_to cls
	cls.new($navi.browser)
end
def turn_to_hash cls,include_text=""
	$navi.goto $base_url+cls.hash_url
	page=turn_to cls
	page.wait_for_ajax
	page
end
def execute_script script,args
	$navi.browser.execute_script script,args
end
Lazyman::Initializer.new(File.expand_path(File.join('.')), 'lazymantest')
$:.unshift(File.expand_path File.join('.'))

RSpec.configure do |c|
	c.treat_symbols_as_metadata_keys_with_true_values = true
	c.run_all_when_everything_filtered = true
	c.alias_example_to :test_case
	c.alias_it_should_behave_like_to :include_shared
	$test_file_path=File.expand_path(File.join('.', 'app', 'test_data', "files"))+"/"
	PageObject.javascript_framework = :jquery
	unless($config.tags.empty?)
		tags = case 
		when String
			$config.tags.lazy_to_hash
		when Hash
			$config.tags
		end #case
		c.filter_run tags
	end 

	def test_data file
		content = ''
		file_path = File.expand_path(File.join('.', 'app', 'test_data', "#{file}.yml"))
		raise "Can not find #{file}.yml" unless File.exists?(file_path)
		File.open(file_path, 'r') do |handle|
			content = handle.read
		end
		Psych.load ERB.new(content).result(binding)
	end
	
	c.before(:suite) do
		$navi = LazymantestNavigator.new $config
	end

	c.after(:suite) do
		$navi.close
	end
end
