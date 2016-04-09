package com.bm.common.util.sync.thread;

import java.util.Date;
import java.util.Stack;

import com.bm.common.util.sync.ITaskHandler;
import com.bm.common.util.sync.SyncTask;

/**
 * 本地任务<br>
 * 
 * @author mike
 *
 */
public class LocalTaskThread implements Runnable {

	private static Stack<SyncTask> taskStack = new Stack<SyncTask>();

	public static boolean isRun = true;

	private static LocalTaskThread instance;
	
	
	static long m = 1000*60;
	

	public synchronized static LocalTaskThread newInstance() {
		if (instance == null)
			synchronized (LocalTaskThread.class) {
				if (instance == null)
					instance = new LocalTaskThread();
			}
		return instance;
	}

	private LocalTaskThread() {
		Thread t = new Thread(this);
		t.start();
		System.out.println("-------The local sync Thread instance success,the task Thread start success!");
	}

	public static void addTask(SyncTask task) {
		taskStack.add(task);
	}

	@Override
	public void run() {
		while (isRun) {
			try {
				for (SyncTask syncTask : taskStack) {
					doTask(syncTask);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					Thread.sleep(m);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private static void doTask(SyncTask task) throws Exception {
		try {
			System.out.println(new Date() + " : -------AT:local - 执行任务      taskId:" + task.getTaskId() + "\t params:"
					+ task.getParams());
			ITaskHandler taskHandler = task.getTaskHandler();
			taskHandler.execute(task.getParams(), task.getTaskId());
			//
		} catch (Exception e) {
			taskStack.remove(task);
			throw new Exception(new Date() + " : -------AT:local - taskId:" + task.getTaskId() + "\t" + e.getMessage()
					+ "-------同步线程执行出现异常！！！");
		}
	}
}
