return {
  filetypes = { 'javascript', 'typescript', 'json', 'jsonc' },
  args = {
    'format',
    '--config-path',
    os.getenv('MYVIMRC'):match '(.*/)',
    '--write',
    '$FILENAME',
  },
}
