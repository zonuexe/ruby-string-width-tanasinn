# -*- coding: utf-8 -*-

$: << File.expand_path(File.dirname(__FILE__))
require 'spec_helper'

describe StringWidth::Tanasinn do
  before(:all){ include StringWidth::Tanasinn }
  context "Ascii" do
    subject do
      {
        "lower A" => "a",
        "large Z" => "Z"
      }.map{|c| wcwidth_amb_as_single(c) }
    end
    its("lower A"){ should eq 1 }
    it "large Z" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("Z").should == 1
    end
  end
  context "Japanese" do
    it "Hiragana NU" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("ぬ").should == 2
    end
    it "Hiragana RU" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("る").should == 2
    end
    it "Hiragana PO" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("ぽ").should == 2
    end
    its "Half Katakana KA" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("ｶ").should == 1
    end
    its "Half Katakana Dakuten sign" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("ﾞ").should == 1
    end
    its "Half Katakana Small TSU" do
      StringWidth::Tanasinn::wcwidth_amb_as_single("ｯ").should == 1
    end
  end
end
