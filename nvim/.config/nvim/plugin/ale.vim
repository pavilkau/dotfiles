" Set specific linters
let g:ale_linters = {}
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
