package com.ji.spring009.error;

import java.util.List;

public interface errorMapper {

	public abstract List<Error> searchAllError();
	public abstract List<Error> searchError(Error e);
	
}
