ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.order("created_at desc").map do |user|
              li link_to(user.email, system_user_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Posts" do
          ul do
            Post.order("created_at desc").map do |post|
              omited_title = post.title.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_title, system_post_path(post))
            end
          end
        end
      end

      column do
        panel "Recent Replies" do
          ul do
            Reply.order("created_at desc").map do |reply|
              omited_content = reply.content.truncate(99, separator: ' ', omission: '...')
              li link_to(omited_content, system_reply_path(reply))
            end
          end
        end
      end
    end
    
  end
end
