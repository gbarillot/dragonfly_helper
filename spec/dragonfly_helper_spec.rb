require 'spec_helper'

describe DragonflyHelper do

  before do
    @member = FactoryGirl.create :member
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "image tag generator" do

    it "should return an image tag with a default alt, width and height attributes" do
      thumbnail_tag(@member.avatar, '10x10')
        .should == "<img src='/images/10x10/default_avatar.png' width='10px' height='10px' alt='default_avatar' />"
    end

    it "should return an image tag with named alt" do
      thumbnail_tag(@member.avatar, '10x10', :alt => 'image title')
        .should == "<img src='/images/10x10/default_avatar.png' width='10px' height='10px' alt='image title'  />"
    end

    it "should return an image tag with a style attribute" do
      thumbnail_tag(@member.avatar, '10x10', :alt => 'image title', :style => 'height:10px;')
        .should == "<img src='/images/10x10/default_avatar.png' width='10px' height='10px' alt='image title' style='height:10px;'  />"
    end

    it "should return an image tag with data attributes" do
      thumbnail_tag(@member.avatar, '10x10', :data => {:do => 'some_action', :handle =>'a_thing'})
        .should == "<img src='/images/10x10/default_avatar.png' width='10px' height='10px' data-do='some_action' data-handle='a_thing' alt='default_avatar' />"
    end

    it "should return an image tag without width and height params" do
      thumbnail_tag(@member.avatar, '10x')
        .should == "<img src='/images/10x/default_avatar.png'   alt='default_avatar' />"
    end

    it "should return an image tag without width and height params" do
      thumbnail_tag(@member.avatar, '50x50%')
        .should == "<img src='/images/50x50%/default_avatar.png'   alt='default_avatar' />"
    end

    it "should return an image tag without width and height params" do
      thumbnail_tag(@member.avatar, '400x300+50+100')
        .should == "<img src='/images/400x300+50+100/default_avatar.png'   alt='default_avatar' />"
    end

    it "should return an image tag with a custom path" do
      thumbnail_tag(@member.avatar, '10x10', :path => '/products/images/cache')
        .should == "<img src='/products/images/cache/10x10/default_avatar.png' width='10px' height='10px' alt='default_avatar' />"

      File.exists?("#{Rails.root}/public/products/images/cache/10x10/default_avatar.png").should == true
    end

  end
end