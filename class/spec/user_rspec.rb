require_relative '../user'

RSpec.describe User do
  subject { described_class.new(user) }

  describe '#create' do
    context 'when assessing positive cases' do
      describe 'when a user with all the data is passed to it' do
        user = {
          'id' => 1, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'josefernandezllanos@gmail.com',
          'age' => 18, 'address' => 'cll15#22760'
        }
        let(:user) { user }

        it 'expect new user create' do
          expect(subject.create).to eq('new user create')
        end
      end

      describe 'when a other user with all the data is passed to it' do
        user2 = {
          'id' => 2, 'name' => 'juan', 'last_name' => 'gutierrez', 'email' => 'jgutierrez@gmailcom',
          'age' => 15, 'address' => 'cll152#12313'
        }
        let(:user) { user2 }

        it 'expect new user create' do
          expect(subject.create).to eq('new user create')
        end
      end
    end

    context 'when assessing negative cases' do
      context 'passing on repeated data' do

        describe 'when a user with a repeated id is passed to you' do
          user = {
            'id' => 1, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'jgutimailcom',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user }

          it 'expect the id cannot be repeated' do
            expect(subject.create).to eq('the id cannot be repeated')
          end
        end

        describe 'when a repeated email is passed ' do
          user2 = {
            'id' => 4, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'josefernandezllanos@gmail.com',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user2 }

          it 'expect the email cannot be repeated' do
            expect(subject.create).to eq('the email cannot be repeated')
          end
        end
      end

      context 'when some data is not passed on' do

        describe 'when we do not pass the id ' do
          user2 = {
            'name' => 'bob', 'last_name' => 'fernandez', 'email' => 'bob@gmailcom',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user2 }

          it 'expect id is required' do
            expect(subject.create).to eq('id is required')
          end
        end

        describe 'when we do not pass the name ' do
          user2 = {
            'id' => 0023, 'last_name' => 'fernandez', 'email' => 'leo@gmailcom',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user2 }

          it 'expect name is required' do
            expect(subject.create).to eq('name is required')
          end
        end

        describe 'when we do not pass the last_name ' do
          user2 = {
            'id' => 991, 'name' => 'mike', 'email' => 'mike@gmailcom',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user2 }

          it 'expect last name is required' do
            expect(subject.create).to eq('last name is required')
          end
        end

        describe 'when we do not pass the email ' do
          user2 = {
            'id' => 888, 'name' => 'sky', 'last_name' => 'none',
            'age' => 18, 'address' => 'cll15#22760'
          }
          let(:user) { user2 }

          it 'expect email is required' do
            expect(subject.create).to eq('email is required')
          end
        end
      end
    end
  end

  describe '#count' do
    user = {
      'id' => 82_902, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => '5372@gmail.com',
      'age' => 17, 'address' => 'cll15#22760'
    }
    let(:user) { user }
    context 'when assessing positive cases' do
      describe 'when we had already created two users' do
        it 'is expect to eq 2' do
          expect(subject.counter).to eq(2)
        end
      end
      describe 'when we had already created 3 users' do
        it 'is expect to eq 3' do
          # in the create test we only create 2 users.
          # now let's create another user
          subject.create
          # puts subject.all.to_s

          expect(subject.counter).to eq(3)
        end
      end
    end
  end

  describe '#all' do
    describe 'calling the method all ' do
      let(:user){''}
      it 'is expected to {...}' do
        expect(subject.all).to eq([{"id"=>1, "name"=>"jose", "last_name"=>"fernandez", "email"=>"josefernandezllanos@gmail.com", "age"=>18, "address"=>"cll15#22760"}, {"id"=>2, "name"=>"juan", "last_name"=>"gutierrez", "email"=>"jgutierrez@gmailcom", "age"=>15, "address"=>"cll152#12313"}, {"id"=>82902, "name"=>"jose", "last_name"=>"fernandez", "email"=>"5372@gmail.com", "age"=>17, "address"=>"cll15#22760"}])
      end
    end
  end

  describe '#find' do
    subject { described_class.new('').find(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 1' do
        let(:id){1}
        it { is_expected.to eq({'id' => 1, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'josefernandezllanos@gmail.com','age' => 18, 'address' => 'cll15#22760'})}
      end

      describe 'when the value of id is 2' do
        let(:id){2}
        it { is_expected.to eq({'id' => 2, 'name' => 'juan', 'last_name' => 'gutierrez', 'email' => 'jgutierrez@gmailcom','age' => 15, 'address' => 'cll152#12313'})}
      end
    end

    context 'when assessing negative cases' do
      let(:id){99_999}
      it { is_expected.to eq('id not found')}
    end
  end

  describe '#where' do
    subject { described_class.new('').where(type,data) }
    context 'when assessing positive cases' do
      describe 'filtering by name' do
        let(:type){'name'}
        let(:data){'jose'}
        it { is_expected.to eq([{'id'=>1, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'josefernandezllanos@gmail.com', 'age'=>18, 'address'=>'cll15#22760'}, {'id'=>82902, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'5372@gmail.com', 'age'=>17, 'address'=>'cll15#22760'}]) }
      end

      describe 'filtering by last name' do
        let(:type){'last_name'}
        let(:data){'fernandez'}
        it { is_expected.to eq([{'id'=>1, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'josefernandezllanos@gmail.com', 'age'=>18, 'address'=>'cll15#22760'}, {'id'=>82902, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'5372@gmail.com', 'age'=>17, 'address'=>'cll15#22760'}]) }
      end

      describe 'filtering by age >=' do
        let(:type){'age>='}
        let(:data){18}
        it { is_expected.to eq([{'id'=>1, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'josefernandezllanos@gmail.com', 'age'=>18, 'address'=>'cll15#22760'}])}
      end

      describe 'filtering by age <=' do
        let(:type){'age<='}
        let(:data){17}
        it { is_expected.to eq([{"id"=>2, "name"=>"juan", "last_name"=>"gutierrez", "email"=>"jgutierrez@gmailcom", "age"=>15, "address"=>"cll152#12313"},{'id'=>82902, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'5372@gmail.com', 'age'=>17, 'address'=>'cll15#22760'}]) }
      end

      describe 'filtering by address' do
        let(:type){'address'}
        let(:data){'cll15#22760'}
        it { is_expected.to eq([{'id'=>1, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'josefernandezllanos@gmail.com', 'age'=>18, 'address'=>'cll15#22760'},  {'id'=>82902, 'name'=>'jose', 'last_name'=>'fernandez', 'email'=>'5372@gmail.com', 'age'=>17, 'address'=>'cll15#22760'}]) }
      end
    end

    context 'negative cases' do
      describe 'filtering by name' do
        let(:type){'name'}
        let(:data){'noexiste'}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by last name' do
        let(:type){'last_name'}
        let(:data){'paero'}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by age >=' do
        let(:type){'age>='}
        let(:data){22}
        it { is_expected.to eq('not found') }
      end

      describe 'filtering by age <=' do
        let(:type){'age<='}
        let(:data){9}
        it { is_expected.to eq('not found') }
      end
    end
  end

  describe '#update' do
    subject { described_class.new('').update(id,object) }
    context 'when assessing positive cases' do
      describe 'change all data' do
        user = {
          'id' => 1, 'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'ismaellllanos@gmail.com',
          'age' => 30, 'address' => 'cll152#2760'
        }
        let(:object){user}
        let(:id){1}
        it{is_expected.to eq(user)}
      end
    end
    context 'when assessing negative cases' do
      context 'changing some data but without some required fields' do
        describe 'without id' do
          user = {
            'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'ismaellllanos@gmail.com',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it{is_expected.to eq('id is required')}
        end

        describe 'without first name' do
          user = {
            'id' => 1, 'last_name' => 'llanos', 'email' => 'ismaellllanos@gmail.com',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it{is_expected.to eq('first name is required')}
        end

        describe 'without last name' do
          user = {
            'id' => 1, 'name' => 'ismael', 'email' => 'ismaellllanos@gmail.com',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it{is_expected.to eq('last name is required')}
        end

        describe 'without email' do
          user = {
            'id' => 1, 'name' => 'ismael', 'last_name' => 'llanos',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it{is_expected.to eq('email is required')}
        end
      end

      context 'when single data are repeated' do
        describe 'when the id is repeated' do
          user = {
            'id' => 2, 'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'ismaellllanos@gmail.com',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it { is_expected.to eq('that id is registered')}
        end

        describe 'when the email is repeated' do
          user = {
            'id' => 1, 'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'jgutierrez@gmailcom',
            'age' => 30, 'address' => 'cll152#2760'
          }
          let(:object){user}
          let(:id){1}
          it { is_expected.to eq('that email is registered')}
        end
      end

      describe 'when the id does not exist' do
        user = {
          'id' => 1, 'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'ismaellllanos@gmail.com',
          'age' => 30, 'address' => 'cll152#2760'
        }
        let(:object){user}
        let(:id){3_172_417}
        it { is_expected.to eq('id not found')}
      end
    end
  end

  describe '#delete' do
    subject { described_class.new('').delete(id) }
    context 'when assessing positive cases' do
      describe 'when the value of id is 1' do
        let(:id){1}
        it {is_expected.to eq({"address"=>"cll152#2760", "age"=>30, "email"=>"ismaellllanos@gmail.com", "id"=>1, "last_name"=>"llanos", "name"=>"ismael"})}
      end
    end

    context 'when assessing negative cases' do
      describe 'when the id value does not exist' do
        let(:id){238923}
        it{is_expected.to eq('id not found')}
      end
    end
  end
end