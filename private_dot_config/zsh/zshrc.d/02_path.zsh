# PATH Settings

# !!warn!! needs periodic updates (mise)
typeset -U PATH path
path=(
    "$HOME/.cargo/bin"
    "$HOME/.dotnet/tools"
    "$HOME/.local/bin"
    "$HOME/.local/share/gem/ruby/3.4.0/bin"
    "$HOME/.nimble/bin"
    "$HOME/perl5/bin"
    "$CARGO_HOME/bin"
    "$GOPATH/bin"
    $path
)
export PATH

# for SageMath
export PYTHONPATH=~/python_sage:$PYTHONPATH

# Perl
export PERL5LIB=$PERL5LIB:$HOME/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$PERL_LOCAL_LIB_ROOT:$HOME/perl5
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
