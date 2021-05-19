class Object
  def try_chain(*args)
    args.inject(self) { |object, method| object.try(method.to_sym) }
  end
end
