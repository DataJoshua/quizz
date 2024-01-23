module Users
  class Create
    include Interactor::Organizer

    organize Users::Create::FindRole,
             Users::Create::Execute
  end
end
