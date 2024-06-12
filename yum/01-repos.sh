yum -y install \
    dnf-plugins-core \
    epel-release \
    
yum config-manager --set-enabled powertools

repo_urls=(
    "https://negativo17.org/repos/epel-multimedia.repo"
    "https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo"
    "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    )

for repo_url in "${repo_urls[@]}"; do
    sudo yum-config-manager --add-repo="$repo_url"
done

yum -y upgrade
