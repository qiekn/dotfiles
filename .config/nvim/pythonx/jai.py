def jai_split_vars(text):
    return [v.strip() for v in text.split(",") if v.strip()]


def jai_debug_call(func, text):
    """
    func: "print" or "log"
    text: "a, b, c"
    returns: print("a=%, b=%, c=%\n", a, b, c);
    """
    vars = jai_split_vars(text)
    fmt = ", ".join([v + "=%" for v in vars])
    args = ", ".join(vars)

    if args:
        return '{}("{}\\n", {});'.format(func, fmt, args)
    else:
        return '{}("{}\\n");'.format(func, fmt)


def jai_type_of(expr):
    expr = expr.strip()
    return 'print("type_of({}) = %\\n", type_of({}));'.format(expr, expr)


def jai_defer(stmt):
    stmt = stmt.strip()
    if stmt.endswith(";"):
        stmt = stmt[:-1].rstrip()
    return "defer {};".format(stmt)

def jai_inline(stmt):
    stmt = stmt.strip()
    if stmt.endswith(";"):
        stmt = stmt[:-1].rstrip()
    return "inline {};".format(stmt)

def postfix_cast_parts(text):
    s = text.strip()

    idx = s.rfind(":=")
    if idx >= 0:
        lhs = s[:idx].rstrip() + " := "
        expr = s[idx + 2:].strip()
        return lhs, expr

    idx = s.rfind("=")
    if idx >= 0:
        lhs = s[:idx].rstrip() + " = "
        expr = s[idx + 1:].strip()
        return lhs, expr

    return "", s

def jai_postfix_cast(text, cast_kind="cast", default_type="u16"):
    """
    text:
        "b = a"  -> "b = cast(u16) a;"
        "b := a" -> "b := cast(u16) a;"
        "a"      -> "cast(u16) a;"
    """
    lhs, expr = postfix_cast_parts(text)

    if cast_kind == "cast":
        prefix = "cast("
    else:
        prefix = "cast,{}(".format(cast_kind)

    return lhs, prefix, expr
