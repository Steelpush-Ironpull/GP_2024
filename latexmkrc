# Quelle: https://de.overleaf.com/learn/how-to/Why_do_I_keep_getting_the_compile_timeout_error_message%3F
# Hilft, wenn das Projekt nicht aufhört zu kompilieren, bis der Timeout kommt, ohne, dass der mögliche Fehler angezeigt werden.
# Datei 'latexmkrc' ohne Extensions/Dateiendung im Hauptverzeichnis anlegen. Das Kompilieren stoppt beim ersten Fehler und zeigt diesen an.
#   aktiv im Projekt verwenden => Dateiname muss lauten: latexmkrc
#   inaktiv im Projekt belassen => Datei umbenennen, z.b. in: tmp_latexmkrc

# Add -shell-escape to pdflatex - needed to run minted
# $pdflatex = 'pdflatex --halt-on-error %O %S';
###################################################
$pdflatex = 'pdflatex --shell-escape --halt-on-error %O %S';
$lualatex = 'lualatex --shell-escape --halt-on-error %O %S';
$xelatex = 'xelatex --shell-escape --halt-on-error %O %S';
$latex = 'latex --shell-escape --halt-on-error %O %S';




# Provide support for Nomencl
################################################################################
add_cus_dep('nlo', 'nls', 0, 'run_makenomencl');
push @generated_exts, 'nlo', 'nls';

sub run_makenomencl {
    if ( $silent ) {
        system "makeindex -q '$_[0].nlo' -s nomencl.ist -o '$_[0].nls'";
    }
    else {
        system "makeindex '$_[0].nlo' -s nomencl.ist -o '$_[0].nls'";
    };
}
