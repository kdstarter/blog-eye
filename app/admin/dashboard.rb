ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.order('created_at desc').limit(15).map do |user|
              li link_to(user.email, system_user_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Posts" do
          ul do
            Post.limit(15).map do |post|
              omited_title = post.title.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_title, system_post_path(post))
            end
          end
        end
      end

      column do
        panel "Recent Codes" do
          ul do
            Code.limit(15).map do |code|
              omited_title = code.title.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_title, system_code_path(code))
            end
          end
        end
      end
    end
    
  end
end
