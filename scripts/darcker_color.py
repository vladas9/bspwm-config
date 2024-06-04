def darken_color(r, g, b, decrease_amount):
    r = max(0, r - decrease_amount)
    g = max(0, g - decrease_amount)
    b = max(0, b - decrease_amount)
    return "#{:02x}{:02x}{:02x}".format(r, g, b)


# Original color in RGB
r, g, b = 22, 31, 46

# Amount to decrease each RGB component by
decrease_amount = 10

# Get darker color
darker_color = darken_color(r, g, b, decrease_amount)
print(darker_color)
