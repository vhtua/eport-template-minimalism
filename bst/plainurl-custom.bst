% plainurl-custom.bst
% Custom bibliography style file based on plainurl

ENTRY
  { address
    author
    booktitle
    editor
    howpublished
    institution
    journal
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    url
  }
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence }

FUNCTION {output.check.newline}
{ newline$ }

FUNCTION {format.url}
{ "URL: " url * }

FUNCTION {output.url}
{ url empty$
    'skip$
    { output.check.newline
      format.url write$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
}

FUNCTION {article}
{ output.bibitem
  author format.names output
  " " write$
  title "title" output.check.newline
  year "year" output.check.newline
  month "month" output.check.newline
  note "note" output.check.newline
  journal "journal" output.check.newline
  volume "volume" output.check.newline
  number "number" output.check.newline
  pages "pages" output.check.newline
  output.url
  newline$
}

% Other entry types (book, inproceedings, etc.) would have similar structure

READ

FUNCTION {default.type} { "misc" }

INTEGERS { output.state before.all mid.sentence after.sentence }

STRINGS { longest.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
}

EXECUTE {initialize.longest.label}

FUNCTION {init.state.consts}
{ before.all
  mid.sentence
  after.sentence
  'output.state :=
}

EXECUTE {init.state.consts}

ITERATE {call.type$}