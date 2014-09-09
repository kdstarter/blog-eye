ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "最近的用户" do
          ul do
            User.order('created_at desc').limit(13).map do |user|
              li link_to(user.email, system_user_path(user))
            end
          end
        end
      end

      column do
        panel "最近的文章" do
          ul do
            Post.limit(13).map do |post|
              omited_title = post.title.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_title, system_post_path(post))
            end
          end
        end
      end

      column do
        panel "最近的代码" do
          ul do
            Code.limit(13).map do |code|
              omited_title = code.title.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_title, system_code_path(code))
            end
          end
        end
      end
    end
    
  end
end
