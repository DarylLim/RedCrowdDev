module ModelStatusMacros

  def has_status_extention
    context 'status' do
      it 'has pending status by default' do
        subject.status = nil
        subject.save!
        expect(subject.status).to eq("#{described_class}::PENDING".constantize)
      end
    end

    it 'has method set_approved!' do
      subject.set_approved!
      expect(subject.status).to eq("#{described_class}::APPROVED".constantize)
    end

    it 'has method set_rejected!' do
      subject.set_rejected!
      expect(subject.status).to eq("#{described_class}::REJECTED".constantize)
    end

    it 'has method approved?' do
      subject.status = "#{described_class}::APPROVED".constantize
      expect(subject.approved?).to eq(true)
    end

    it 'has method pending?' do
      subject.status = "#{described_class}::PENDING".constantize
      expect(subject.pending?).to eq(true)
    end


    it 'has method rejected?' do
      subject.status = "#{described_class}::REJECTED".constantize
      expect(subject.rejected?).to eq(true)
    end
  end

end
