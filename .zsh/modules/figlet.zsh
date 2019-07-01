# Install zsh initial dependencies.
if ! type "figlet" > /dev/null; then
	echo 'Install figlet...'
	brew install figlet
fi

if ! type "lolcat" > /dev/null; then
	echo 'Install lolcat...'
	sudo gem install lolcat
fi
# Show login text when you login
LOGIN=$(figlet -f ~/.local/share/fonts/maxiwi.flf "Hello, World!")
echo ""
echo $LOGIN | lolcat
echo ""
