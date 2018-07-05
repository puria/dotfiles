options.timeout = 120
options.create = true
options.subscribe = true
options.expunge = true

function get_password(username)
  local command = string.format('gpg -q --no-tty -d $HOME/.mutt/accounts/%s/password.gpg', username)
  local handle = io.popen(command)
  local result = handle:read('*a')
  handle:close()
  return result:match('"(.-)"')
end

dyne = IMAP {
  server = "mail.dyne.org",
  username = "puria@dyne.org",
  password = get_password("puria@dyne.org"),
  ssl = "tls1"
}

function move_ml(account, address, folder)
  messages = account["INBOX"]:contain_to(address)
  messages:move_messages(account[folder])
  messages = account["INBOX"]:contain_cc(address)
  messages:move_messages(account[folder])
end

function move_nl(account, address, folder)
  messages = account["INBOX"]:contain_from(address)
  messages:move_messages(account[folder])
end


move_ml(dyne, "hackmeeting@inventati.org", "hm")
move_ml(dyne, "decode@lists.dyne.org", "DECODE")

move_nl(dyne, "builds@travis-ci.org", "develop")
move_nl(dyne, "notifications@github.com", "develop")
move_nl(dyne, "support@github.com", "develop")
move_ml(dyne, "dev@dyne.org", "develop")

move_ml(dyne, "monday@lists.dyne.org", "bureau")

