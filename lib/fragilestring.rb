require 'rubygems'
require 'pit'
require 'digest/sha1'

module FragileString
  PREFIX = "fragilestring"
  def self.getstr
    [ "HOME",
      "DBUS_SESSION_BUS_ADDRESS",
      "LANG",
      "DESKTOP_SESSION",
      "XMODIFIERS",
      "GDM_KEYBOARD_LAYOUT",
      "GDM_LANG",
      "GDMSESSION",
      "LANGUAGE",
      "LOGNAME",
      "XDG_DATA_DIRS",
      "DISPLAY",
      "GTK_IM_MODULE",
      "SSH_AGENT_PID",
      "TERM",
      "SHELL",
      "XDG_SESSION_COOKIE",
      "GTK_RC_FILES",
      "GTK_MODULES",
      "USER",
      "GNOME_KEYRING_SOCKET",
      "SSH_AUTH_SOCK",
      "SESSION_MANAGER",
      "USERNAME",
      "PATH",
    ].map{|k|ENV[k]}.join
  end
  def self.encrypt(value, str)
    value # TODO
  end
  def self.decrypt(value, str)
    value # TODO
  end
  def self.get
    data = Pit.get("fragilestring")
    raise if data.nil?
    str = getstr
    digest = Digest::SHA1.hexdigest(str)
    if data[:digest] == digest
      value = data[:value]
      decrypt(value, str)
    else
      yield
    end
  end
  def self.put(value)
    str = getstr
    digest = Digest::SHA1.hexdigest(str)
    value = encrypt(value, str)
    Pit.set("fragilestring", :data => { :digest => digest, :value => value })
  end
end
