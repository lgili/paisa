npm install
npm run build
# go build
# nix-build ledger.nix
# cp ./result/bin/ledger internal/binary/ledger
cd desktop
go install github.com/wailsapp/wails/v2/cmd/wails@latest
# wails doctor
wails build #-tags webkit2_40
cp build/bin/Paisa build/linux/usr/local/bin
cp -r build/linux/ paisa_0.5.5_amd64
dpkg --build paisa_0.5.5_amd64
cd ..
mv desktop/paisa_0.5.5_amd64.deb paisa-app-linux-amd64.deb
sudo chmod +x paisa-app-linux-amd64.deb
dpkg -i paisa-app-linux-amd64.deb
sudo mv /usr/local/bin/Paisa $HOME/Documents/personal-accounting/