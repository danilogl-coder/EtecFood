String? validadePhone(String phoneNumber)
{
  // Remover espaços, traços e outros caracteres especiais do número
  String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

   // Verificar se o número tem pelo menos 10 dígitos (exemplo: 555-555-5555)
  if (cleanNumber.length < 9) {
    return 'O número de celular deve ter pelo menos 9 dígitos.';
  }

   // Definir uma expressão regular para verificar se o número consiste apenas em dígitos
  RegExp digitPattern = RegExp(r'^\d+$');

  if (!digitPattern.hasMatch(cleanNumber)) {
    return 'O número de celular deve conter apenas dígitos.';
  }
  return null;
}

