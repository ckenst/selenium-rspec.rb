# Showing how to do an implicit wait for dynamic loading page. Shows 2 tests

require_relative '../pages/dynamic_loading'
require_relative 'spec_helper'

describe 'Dynamic Loading' do

	before(:each) do
		@dynamic_loading = DynamicLoading.new(@driver)
	end

	it 'Waited for Hidden Element' do
		@dynamic_loading.visit_example 1
		@dynamic_loading.start
		expect(@dynamic_loading.finish_text_present?).to eql true
	end

	it 'Waited for Element To Render' do
		@dynamic_loading.visit_example 2
		@dynamic_loading.start
		expect(@dynamic_loading.finish_text_present?).to eql true
	end

end
