options.timeout = 120
options.create = true
options.subscribe = true
options.expunge = true
options.info = false

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
  account["INBOX"]:contain_to(address):move_messages(account[folder])
  account["INBOX"]:contain_from(address):move_messages(account[folder])
  account["INBOX"]:contain_cc(address):move_messages(account[folder])
  account["INBOX"]:match_field('Reply-To', '.*' .. address .. '.*'):move_messages(account[folder])
  account["INBOX"]:contain_field("List-Id", address):move_messages(account[folder])
end

function move_nl(account, address, folder)
  account["INBOX"]:match_from(address):move_messages(account[folder])
end

function move_alias(account, address, folder)
  account["INBOX"]:contain_to(address):move_messages(account[folder])
end

move_ml(dyne, "hackmeeting@inventati.org", "hm")
move_ml(dyne, "decode@lists.dyne.org", "DECODE")
move_ml(dyne, "trl@lists.dyne.org", "TRL")
move_ml(dyne, "dyne-ledger@lists.dyne.org", "LEDGER")
move_ml(dyne, "ledger@lists.dyne.org", "LEDGER")
move_ml(dyne, "ledger-teams-2019@lists.dyne.org", "LEDGER")
move_ml(dyne, "dyne-reflow@lists.dyne.org", "REFLOW")

move_nl(dyne, "builds@travis-ci.com", "develop")
move_nl(dyne, "builds@travis-ci.org", "develop")
move_nl(dyne, "notifications@github.com", "develop")
move_nl(dyne, "noreply@github.com", "develop")
move_nl(dyne, "support@github.com", "develop")
move_nl(dyne, "support@npmjs.com", "develop")
move_ml(dyne, "dev@dyne.org", "develop")

move_ml(dyne, "monday@lists.dyne.org", "bureau")
move_ml(dyne, "nexa@server-nexa.polito.it", "nexa")
move_ml(dyne, "devuan-dev@lists.dyne.org", "devuan")
move_ml(dyne, "cypherpunks@cpunks.org", "cpunks")
move_ml(dyne, "cypherpunks@lists.cpunks.org", "cpunks")
move_ml(dyne, "cypherpunks.lists.cpunks.org", "cpunks")

move_alias(dyne, "hello@trl-solutions.com", "hello")
move_nl(dyne, "cloud@dyne.org", "cloud")

move_ml(dyne, "sawtooth@lists.hyperledger.org", "hyperledger")
move_ml(dyne, "main@lists.hyperledger.org", "hyperledger")

move_nl(dyne, "biznotif@iso.org", "ISO")
move_nl(dyne, "livelinkisotc@iso.org", "ISO")
move_nl(dyne, "/*@iso.org/", "ISO")
move_nl(dyne, "evgeny@the-syllabus.com", "syllabus")




