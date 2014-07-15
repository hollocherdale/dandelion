require 'rails_helper'

describe Adventure do
  it { should respond_to(:story) }
  it { should respond_to(:choice) }
  it { should respond_to(:user) }

  # I don't know why I need to create a user or adventure
  
  # let(:user) { FactoryGirl.create(:user) }
  # before { @adventure = user.adventures.build(story: 'story', choice: 'choice') }
  # subject { @adventure }

  it 'has state' do
    expect(subject.state).to eq('pending')
  end

  describe 'how the state can be changed' do
    around(:each) { subject.publish }

    context 'when published' do
      it 'should be accepting_submissions' do
        expect(subject.state).to eq('accepting_submissions')
      end   
    end

    context 'when populated' do
      around(:each) { subject.populate }

      it 'should be accepting_submissions' do
        expect(subject.state).to eq('populated')
      end   

      context 'when unpopulated' do
        around { subject.unpopulate }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('accepting_submissions')
        end   
      end

      context 'when upvoted' do
        around { subject.upvoted }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('popular')
        end   
      end

      context 'when closed' do
        around { subject.close }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('closed')
        end

        context 'when popular' do
          around { subject.upvote }
          around { subject.close }

          it 'should be accepting_submissions' do
            expect(subject.state).to eq('closed')
          end
        end
      end
    end
  end
end