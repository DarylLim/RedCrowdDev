require 'rails_helper'

RSpec.describe RedCrowd::Investor::Campaign::Reward do
  let(:subject) { described_class.new @attributes }
  let(:valid_attributes) do
    {
      tagline: Forgery(:lorem_ipsum).words(10),

    }
  end

  let(:invalid_attributes) do
    {}
  end

  before(:each) do
    @attributes = valid_attributes
  end

  context '#save' do
    context 'valid_attributes' do
      it 'returns true' do
        expect(subject.save).to eq(true)
      end
    end

    context 'invalid_attributes' do
      after(:each) do
        expect(subject.save).to eq(false)
      end

      context '#BASIS' do
        it 'has blank tagline' do
          @attributes[:tagline] = nil
        end

        it 'has blank card_image' do
          @attributes[:card_image] = nil
        end

        it 'has blank category' do
          @attributes[:category] = nil
        end

        it 'has blank tags' do #TODO setup plugin for tagging
          @attributes[:tags] = nil
        end

        it 'has blank deadline' do #TODO setup plugin for tagging
          @attributes[:deadline] = nil
        end
      end

      context '#STORY' do
        pending 'invalid if blank campaign pick image or video'
      end

      context '#FUNDING TYPES' do
        it 'has blank funding_type' do
          @attributes[:funding_type] = nil
        end
      end

      context '#EXTRA' do
        it 'has blank facebook_shared_image' do
          @attributes[:facebook_shared_image] = nil
        end

        it 'has blank custom_short_url' do
          @attributes[:custom_short_url] = nil
        end

        it 'has blank facebook_url' do
          @attributes[:facebook_url] = nil
        end

        it 'has blank twitter' do
          @attributes[:twitter] = nil
        end

        it 'has blank youtube' do
          @attributes[:youtube] = nil
        end

        it 'has blank website' do
          @attributes[:website] = nil
        end

        pending 'video gallery' 
        pending 'image gallery' 
      end

    end
  end
end
