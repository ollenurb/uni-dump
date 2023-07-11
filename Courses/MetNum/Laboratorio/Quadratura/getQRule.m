function qRule = getQRule(qName)
%function qRule = getQRule(name)
%
% Restituisce una struct con la regola
% di quadratura corrispondente alla
% stringa "name" in input

switch (qName)
case 'PM'
  qRule.xNodes  =[0.5];
  qRule.qWeights=[1.0];
  qRule.gExact  =1;
case 'TR'
  qRule.xNodes  =[0.0, 1.0];
  qRule.qWeights=[0.5, 0.5];
  qRule.gExact  =1;
case 'CS'
  qRule.xNodes  =[0.0, 0.5, 1.0];
  qRule.qWeights=[1/6, 2/3, 1/6];
  qRule.gExact  =3;
otherwise
  error('Regola di quadratura %s sconosciuta',qName)
end