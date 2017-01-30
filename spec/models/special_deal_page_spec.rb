require 'rails_helper'

RSpec.describe SpecialDealPage, type: :model do

  let(:now) { Time.zone.now}

  before do
    allow(subject).to receive(:valid_from)
    allow(subject).to receive(:valid_until)
  end

  subject {
    mock_obj(
      SpecialDealPage
    )
  }

  it "should have a nil valid_from and a nil valid_until" do
    expect(subject.valid_from).to be nil
    expect(subject.valid_until).to be nil
  end

  it "should have a valid valid_from attribute" do
    two_days_ago = now - 2.days
    allow(subject).to receive(:valid_from) {two_days_ago}
    expect(subject.valid_from).to eq(now - 2.days)
  end

  it "should have a valid valid_until attribute" do
    in_two_days = now + 2.days
    allow(subject).to receive(:valid_until) {in_two_days}
    expect(subject.valid_until).to eq(now + 2.days)
  end

  describe "#active?" do

    context "valid_from < now" do
      before do
        allow(subject).to receive(:valid_from) { now - 2.days }
      end

      it "should not be active when valid_until < now" do
        allow(subject).to receive(:valid_until) { now - 1.days}
        expect(subject.active?).to be false
      end

      it "should be active when valid_until = nil" do
        allow(subject).to receive(:valid_until) { nil }
        expect(subject.active?).to be true
      end

      it "should be active when valid_untile > now" do
        allow(subject).to receive(:valid_until) { now + 2.days }
        expect(subject.active?).to be true
      end
    end


    context "valid_from = nil" do
      before do
        allow(subject).to receive(:valid_from) { nil }
      end

      it "should not be active when valid_from < now" do
        allow(subject).to receive(:valid_until) { now - 1.days}
        expect(subject.active?).to be false
      end

      it "should be active when valid_from = nil" do
        allow(subject).to receive(:valid_until) {nil}
        expect(subject.active?).to be true
      end

      it "should be active when valid_until > now" do
        allow(subject).to receive(:valid_until) { now + 2.days }
        expect(subject.active?).to be true
      end
    end

    context "valid_from = nil" do
      before do
        allow(subject).to receive(:valid_from) { now + 2.days }
      end

      it "should not be active when valid_from < now" do
        allow(subject).to receive(:valid_until) { now - 1.days }
        expect(subject.active?).to be false
      end

      it "should not be active when valid_from = nil" do
        allow(subject).to receive(:valid_until) { nil }
        expect(subject.active?).to be false
      end


      it "should not be active when valid_until > now" do
        allow(subject).to receive(:valid_until) { now + 2.days }
        expect(subject.active?).to be false
      end
    end
  end
end
