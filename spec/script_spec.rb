require './script.rb'

describe '#get_filenames' do

end

describe '#sort_filenames' do

  let(:filenames) { ['052.createtable.sql', '048.createtable.sql',
    '132createtable.sql', '026.createtable.sql'] }

  it 'sorts array in numerical order' do
  expect(filenames.sort_filenames).to be
  ['026.createtable.sql','048.createtable.sql','052.createtable.sql','132createtable.sql']
  end

end

describe '#get_db_version' do

end

 describe '#identify_valid_scripts' do

   context 'db version number = highest script number' do

   end

   context 'script number > than db version number' do

   end

 end

 describe '#run_valid_scripts' do

 end

 describe '#update_db_version_number' do

   context 'script has been executed' do

   end

 end
