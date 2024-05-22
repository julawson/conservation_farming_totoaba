price_poacher_bertrand_lq = function(x,
                                     sigma. = sigma, 
                                     a_f. = a_f, 
                                     a_w. = a_w, 
                                     b_f. = b_f, 
                                     b_w. = b_w, 
                                     e. = e, 
                                     v. = v, 
                                     c. = c, 
                                     W1. = W1, 
                                     W2. = W2){
  y = 2*b_w.*W2.*((2*a_w. + e.*v.)*b_f. + e.*a_f. + c.*(e.^2 - b_f.*b_w.)) + W1.*sigma.*x*(4*b_f.*b_w. - e.^2)
  z = sigma.^2 * x^2 * (4*b_w.*b_f. - e.^2) + 4*b_w.*W2.*(2*b_f.*b_w - e.^2)
  result = y/z
  return(result)
}

composite_bertrand_lq = function(x,
                                 sigma. = sigma, 
                                 a_f. = a_f, 
                                 a_w. = a_w, 
                                 b_f. = b_f, 
                                 b_w. = b_w, 
                                 e. = e, 
                                 v. = v, 
                                 c. = c, 
                                 W1. = W1, 
                                 W2. = W2){
  y = b_w. * ((2*a_w. +e.*v.)*b_f. + e.*a_f. + (price_poacher_bertrand_lq(x)+c.)*(e.^2 - 2*b_w.*b_f))/(4*b_f.*b_w. - e.^2)
  return(y)
}

bertrand_harvest_lq = function(x,
                               sigma. = sigma, 
                               a_f. = a_f, 
                               a_w. = a_w, 
                               b_f. = b_f, 
                               b_w. = b_w, 
                               e. = e, 
                               v. = v, 
                               c. = c, 
                               W1. = W1, 
                               W2. = W2){
  y1 = b_w.*(sigma.^2 * x^2 *((2*a_w. +e.*v.)*b_f. + e.*a_f.) + (c. + W1. * sigma. * b_w. * x)*(e.^2 - 2*b_w. *b_f.))
  y2 = 2*W2.*b_w.*(2*b_f.* b_w. - e.^2) + (4*b_f.*b_w. - e.^2)*sigma.^2*x^2
  z = y1/y2
  return(z)
}

data = data.frame(x = seq(0, k))%>%
  mutate(price = price_poacher_bertrand_lq(x),
         bertrand = composite_bertrand_lq(x),
         harvest_fixed_price = (price_poacher_bertrand_lq(x)*sigma^2*x^2 - W1*sigma*x)/(2*W2),
         bertrand_harvest = bertrand_harvest_lq(x))

data %>%
  ggplot(aes(x = x, y = bertrand_harvest))+
  geom_line()

###########################

s = function(x){
  y = 2*W2*b_w*(b_f*(2*a_w + e*v) + e*a_f + c*(e^2 - 2*b_f*b_w)) + W1*sigma*x*(4*b_f*b_w - e^2)
  z = sigma^2*x^2*(4*b_f*b_w - e^2) + (2*b_f*b_w - e^2)*2*W2*b_w
  return(y/z)
}
s(0)

harvest = function(x){
  y = (s(x)*sigma^2*x^2 - W1*sigma*x)/(2*W2)
  return(y)
}

harvest(0)

data = data.frame(x = seq(0, k))%>%
  mutate(growth = growth(x),
         harvest = harvest(x))
data%>%
  pivot_longer( -x, 
                names_to = 'names', 
                values_to = 'values')%>%
  ggplot(aes( x= x, y = values, colors = names))+
  geom_line()
data


(e^2 - 2*b_f*b_w)*s(0)

harvest_bertrand = function(x){
  y = (b_f*(2*a_w + e*v) + e*a_f + s(x)*(e^2 - 2*b_f*b_w))/(2*W2)
return(y)
}
harvest_bertrand(0)
harvest_bertrand(10)

##########################

s = function(x){
  y = 2*W2*b_w*(b_f*(2*a_w + e*v) + e*a_f + c*(e^2 - 2*b_f*b_w)) + W1*sigma*x*(4*b_f*b_w - e^2)
  z = sigma^2*x^2*(4*b_f*b_w - e^2) + (2*b_f*b_w - e^2)*2*W2*b_w
  return(y/z)
}

price_poacher_bertrand_lq = function(x,
                                     sigma. = sigma, 
                                     a_f. = a_f, 
                                     a_w. = a_w, 
                                     b_f. = b_f, 
                                     b_w. = b_w, 
                                     e. = e, 
                                     v. = v, 
                                     c. = c, 
                                     W1. = W1, 
                                     W2. = W2){
  y = 2*b_w.*W2.*((2*a_w. + e.*v.)*b_f. + e.*a_f. + c.*(e.^2 - 2* b_f.*b_w.)) + W1.*sigma.*x*(4*b_f.*b_w. - e.^2)
  z = sigma.^2 * x^2 * (4*b_w.*b_f. - e.^2) + 2*b_w.*W2.*(2*b_f.*b_w - e.^2)
  result = y/z
  return(result)
}

