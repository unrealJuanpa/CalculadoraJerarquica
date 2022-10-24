%{
    #include "calcatr.tab.h"    
%}

%% 
"+"         { return SUMA;  }
"-"         { return RESTA; }
"*"         { return MULT;  }
"/"         { return DIV;   }
"("         { return PI;    }
")"         { return PF;    }
\n          { return EOL;   }
[0-9]+      { yylval.nint = atoi(yytext); return ENTERO; }
.           {  }

%%
