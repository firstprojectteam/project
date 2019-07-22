package org.zerock.service;

public interface GenericService<VO, K> {

	public Integer register(VO vo);

	public VO get(K key);

	public int modify(VO vo);

	public int remove(K key);

}
