"syn match NERDTreeCsharpDesignerFile '.*\.designer\.cs' containedin=NERDTreeFile
syn region NERDTreeCsharpDesignerFile start='^' end='\.designer\.cs$' containedin=NERDTreeFile oneline
syn region NERDTreeCsharpProjectFile start='^' end='\.csproj$' containedin=NERDTreeFile oneline
syn region NERDTreeCsharpSolutionFile start='^' end='\.sln$' containedin=NERDTreeFile oneline
