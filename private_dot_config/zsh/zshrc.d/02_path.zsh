# PATH Settings

# !!warn!! needs periodic updates (mise)
typeset -U PATH path
path=(
    "$HOME/.dotnet/tools"
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "$HOME/perl5/bin"
    "$HOME/.local/share/gem/ruby/3.4.0/bin"
    $path
)
export PATH

# Perl
export PERL5LIB=$PERL5LIB:$HOME/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$PERL_LOCAL_LIB_ROOT:$HOME/perl5
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
