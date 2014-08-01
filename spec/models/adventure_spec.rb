require 'rails_helper'

describe Adventure do
  let(:user) { FactoryGirl.create(:user) }
  before { @adventure = user.adventures.build(story: 'story', choice: 'choice') }
  subject { @adventure }

  it { should respond_to(:story) }
  it { should respond_to(:choice) }
  it { should respond_to(:user) }

  it 'has state' do
    expect(subject.state).to eq('pending')
  end

  describe 'state can be changed' do
    before(:each) { subject.publish }

    context 'when published' do
      it 'should be accepting_submissions' do
        expect(subject.state).to eq('accepting_submissions')
      end
    end

    context 'when populated' do
      before(:each) { subject.populate }

      it 'should be accepting_submissions' do
        expect(subject.state).to eq('populated')
      end

      context 'when unpopulated' do
        before { subject.unpopulate }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('accepting_submissions')
        end
      end

      context 'when upvoted' do
        before { subject.upvoted }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('popular')
        end
      end

      context 'when closed' do
        before { subject.close }

        it 'should be accepting_submissions' do
          expect(subject.state).to eq('closed')
        end

        context 'when popular' do
          before { subject.upvoted }
          before { subject.close }

          it 'should be accepting_submissions' do
            expect(subject.state).to eq('closed')
          end
        end
      end
    end
  end
end
