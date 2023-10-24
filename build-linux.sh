
npm install  # run as normal user
npm run build # run as normal user
go build # run as normal user
# nix-build ledger.nix
# cp ./result/bin/ledger internal/binary/ledger
cd desktop
# rm -r paisa_0*  # always remove old version
go install github.com/wailsapp/wails/v2/cmd/wails@latest
wails doctor
wails build #-tags webkit2_40