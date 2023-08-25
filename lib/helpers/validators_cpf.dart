String? validateCPF(String cpf) {
  // Remover espaços, traços e outros caracteres especiais do CPF
  String cleanCPF = cpf.replaceAll(RegExp(r'[^\d]'), '');

  // Verificar se o CPF tem exatamente 11 dígitos
  if (cleanCPF.length != 11) {
    return 'O CPF deve ter exatamente 11 dígitos.';
  }

  // Definir uma expressão regular para verificar se o CPF consiste apenas em dígitos
  RegExp digitPattern = RegExp(r'^\d+$');

  if (!digitPattern.hasMatch(cleanCPF)) {
    return 'O CPF deve conter apenas dígitos.';
  }

  // Verificar se o CPF é uma sequência de dígitos repetidos (ex: 111.111.111-11)
  if (cleanCPF == '00000000000' ||
      cleanCPF == '11111111111' ||
      cleanCPF == '22222222222' ||
      cleanCPF == '33333333333' ||
      cleanCPF == '44444444444' ||
      cleanCPF == '55555555555' ||
      cleanCPF == '66666666666' ||
      cleanCPF == '77777777777' ||
      cleanCPF == '88888888888' ||
      cleanCPF == '99999999999') {
    return 'CPF inválido.';
  }

  // Aqui você pode adicionar a lógica para verificar a validade do CPF de acordo com os dígitos verificadores

  // Se o CPF passar por todas as verificações, retorne null (sem erro)
  return null;
}