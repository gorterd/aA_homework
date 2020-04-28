module ApplicationHelper

    def auth_token
        tag = "<input "

        tag += 'type="hidden"'
        tag += 'name="authenticity_token"'
        tag += "value='#{form_authenticity_token}' >"

        tag.html_safe
    end
end
