# Setup xcode
xcode-select --install

# Get brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew cask install iterm2
brew cask install visual-studio-code
brew cask install firefox
brew install git
brew install iterm2

while read line; do code --install-extensions "$line"; done < vscode-extensions.txt

# Install ZPrezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Switch the prompt
sed -ie 's/sorin/powerlevel10k/g' ~/.zpreztorc

cd $ZPREZTODIR
git pull
git submodule update --init --recursive