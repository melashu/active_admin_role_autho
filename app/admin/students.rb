ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :age, :status
  
  batch_action 'Approve for ', method: :put, confirm: 'Are you sure?' do |ids|
     Student.where(id: ids).update(status: 1)
     redirect_to admin_students_path, notice: "#{ids.size} #{'booking'.pluralize(ids.size)} set approved"
  end
  batch_action 'Rejected for ', method: :put, confirm: 'Are you sure?' do |ids|
     Student.where(id: ids).update(status: 2)
     redirect_to admin_students_path, notice: "#{ids.size} #{'booking'.pluralize(ids.size)} set rejected"

  end
  batch_action 'Pending for ', method: :put, confirm: 'Are you sure?' do |ids|
     Student.where(id: ids).update(status: 0)
     redirect_to admin_students_path, notice: "#{ids.size} #{'booking'.pluralize(ids.size)} set pending"
  end

  index title: "Booking" do
    selectable_column
    column :first_name
    column :last_name
    # column :age
    column :status
    actions
  end
  
end
