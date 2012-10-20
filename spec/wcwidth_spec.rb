# -*- coding: utf-8 -*-

$: << File.expand_path(File.dirname(__FILE__))
require 'spec_helper'

describe StringWidth::Tanasinn do
  before(:all){ include StringWidth::Tanasinn }
  describe "As single" do
    context "Ascii" do
      it "large A" do
        StringWidth::Tanasinn::wcwidth_amb_as_single("A").should == 1
      end
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
      it "Half Katakana GA" do
        ->{
          StringWidth::Tanasinn::wcwidth_amb_as_single("ｶﾞ")
        }.should raise_error ArgumentError
      end
      it "Half Katakana Small TSU" do
        StringWidth::Tanasinn::wcwidth_amb_as_single("ｯ").should == 1
      end
    end
  end
  describe "As double" do
    context "Ascii" do
      it "large A" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("A").should == 1
      end
      it "large Z" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("Z").should == 1
      end
    end
    context "Japanese" do
      it "Hiragana NU" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("ぬ").should == 2
      end
      it "Hiragana RU" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("る").should == 2
      end
      it "Hiragana PO" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("ぽ").should == 2
      end
      it "Half Katakana GA" do
        ->{
          StringWidth::Tanasinn::wcwidth_amb_as_double("ｶﾞ")
        }.should raise_error ArgumentError
      end
      it "Half Katakana Small TSU" do
        StringWidth::Tanasinn::wcwidth_amb_as_double("ｯ").should == 1
      end
    end
  end
end
