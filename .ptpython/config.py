from ptpython.layout import CompletionVisualisation

__all__ = (
    'configure',
)

def configure(repl):
    repl.enable_mouse_support = True
    repl.confirm_exit = False 
    repl.use_code_colorscheme('fruity')
    repl.true_color = True 
