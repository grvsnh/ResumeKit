\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/07/12 ResumeKit]

\LoadClass[10pt,a4paper]{article}

\RequirePackage[a4paper,margin=0.65in]{geometry}

\RequirePackage{components/engine}
\RequirePackage{components/header}
\RequirePackage{components/section}
\RequirePackage{components/utils}
\RequirePackage{components/experience}
\RequirePackage{components/project}
\RequirePackage{components/education}
\RequirePackage{components/skills}
\RequirePackage{components/certification}

\AtEndPreamble{%
    % Sane defaults if not set
    \ifcsempty{RK@Theme}{\gdef\RK@Theme{modern}}{}%
    \ifcsempty{RK@Font}{\gdef\RK@Font{Noto Sans}}{}%
    \ifcsempty{RK@Density}{\gdef\RK@Density{compact}}{}%
    \ifcsempty{RK@Accent}{\gdef\RK@Accent{black}}{}%
    
    % Define the accent color first (themes like modern.sty reference ResumeAccent, so it must exist)
    \ifcsempty{RK@Accent}{%
        \definecolor{ResumeAccent}{HTML}{000000}% default black
    }{%
        \ifcsname\string\color@\RK@Accent\endcsname
            \colorlet{ResumeAccent}{\RK@Accent}%
        \else
            \definecolor{ResumeAccent}{HTML}{\RK@Accent}%
        \fi
    }%
    
    % Load theme package
    \ifcsempty{RK@Theme}{}{%
        \RequirePackage{themes/\RK@Theme}%
    }%
    
    % Apply page margins and spacing based on density
    \ifdefstring{\RK@Density}{compact}{%
        \geometry{margin=0.4in}% Tighter margin for strict single page A4
        \def\RKItemSep{1.5pt}%
        \def\RKSpaceVal{3pt}%
        \def\RKSmallSpaceVal{1.5pt}%
    }{%
        \ifdefstring{\RK@Density}{relaxed}{%
            \geometry{margin=0.8in}%
            \def\RKItemSep{4pt}%
            \def\RKSpaceVal{10pt}%
            \def\RKSmallSpaceVal{5pt}%
        }{%
            \geometry{margin=0.6in}% default/comfortable
            \def\RKItemSep{2.5pt}%
            \def\RKSpaceVal{5pt}%
            \def\RKSmallSpaceVal{2.5pt}%
        }%
    }%
}

\pagestyle{empty}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

\endinput